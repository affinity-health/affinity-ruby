# frozen_string_literal: true
require 'json'
require 'net/http'
require 'securerandom'
require 'time'
require 'timeout'

module Affinity
  class Error < StandardError
    attr_reader :status, :code, :request_id, :retry_after
    def initialize(status, problem, retry_after)
      @status, @code, @request_id, @retry_after = status, problem['code'], problem['requestId'], retry_after
      super("Affinity API request failed (#{status})")
    end
    def retryable? = [408, 429, 500, 502, 503, 504].include?(@status)
  end
  class SDKTransport
    def initialize(api_key, base_url: 'https://api.affinityrx.com', timeout: 60, max_retries: 0)
      raise ArgumentError, 'An API key is required' if api_key.to_s.strip.empty?
      raise ArgumentError, 'Invalid timeout or retry limit' unless timeout.positive? && max_retries.is_a?(Integer) && max_retries.between?(0,10)
      @key, @base_url, @timeout, @max_retries = api_key, base_url.sub(%r{/$}, ''), timeout, max_retries
      @mutex = Mutex.new
    end
    def access
      @mutex.synchronize do
        @identity ||= begin
          subject = request('/v1/auth/access', 'GET', nil, {})['serviceAccount']
          raise 'Invalid API key access response' unless subject.is_a?(Hash) && subject['subjectType'].is_a?(String) && subject['subjectId'].is_a?(String)
          subject
        end
      end
    end
    def request(path, method, body, headers)
      url = URI(@base_url + path)
      payload = JSON.generate(body) unless body.nil?
      retries = method == 'GET' || headers.key?('Idempotency-Key') ? @max_retries : 0
      attempt = 0
      loop do
        delay = 0.25 * (2**attempt)
        begin
          response = Timeout.timeout(@timeout) do
            Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https', open_timeout: @timeout, read_timeout: @timeout, write_timeout: @timeout) do |http|
              request = Net::HTTPGenericRequest.new(method, !payload.nil?, true, url.request_uri, {'Authorization'=>"Bearer #{@key}", 'Affinity-Version'=>'2026-09-28'}.merge(headers))
              if payload
                request['Content-Type'] = 'application/json'
                request.body = payload
              end
              http.request(request)
            end
          end
          status = response.code.to_i
          return response.body.to_s.empty? ? nil : JSON.parse(response.body) if status.between?(200,299)
          problem = begin JSON.parse(response.body); rescue JSON::ParserError; {}; end
          retry_after = begin
            value = response['Retry-After']
            value ? [0, Float(value, exception: false) || Time.httpdate(value) - Time.now].max : nil
          rescue ArgumentError
            nil
          end
          error = Error.new(status, problem.is_a?(Hash) ? problem : {}, retry_after)
          raise error unless error.retryable? && attempt < retries
          delay = [delay, retry_after || 0].max
        rescue IOError, SystemCallError, Timeout::Error
          raise if attempt >= retries
        end
        sleep([delay,30].min)
        attempt += 1
      end
    end
  end
  class SDKContext
    attr_reader :transport, :practice_id
    def initialize(transport, practice_id = nil)
      @transport, @practice_id = transport, practice_id
      freeze
    end
    def wire(value, shape)
      return value if value.nil? || shape.nil?
      return value.map { |v| wire(v, shape['items']) } if value.is_a?(Array) && shape['items']
      return value unless value.is_a?(Hash) && shape['fields']
      value.each_with_object({}) do |(key,val), result|
        field = shape['fields'][key.to_s]
        raise ArgumentError, "Unknown parameter #{key}" unless field
        result[field['wire']] = wire(val, field['shape'])
      end
    end
    def call(operation, ids, params = {}, options = {})
      op = SDK_OPERATIONS.fetch(operation)
      raise ArgumentError, 'Use the root client for platform-wide operations' if op['rootOnly'] && @practice_id
      raise ArgumentError, 'Conflicting practice ID' if @practice_id && options[:practice_id] && @practice_id != options[:practice_id]
      raise ArgumentError, 'Pass practice_id in request options' if params.key?(:practice_id) || params.key?(:practiceId)
      key = options[:idempotency_key]
      raise ArgumentError, 'idempotency_key must not be empty' if key && key.strip.empty?
      raise ArgumentError, 'A persisted idempotency_key is required' if op['idempotency'] == 'required' && !key
      raise ArgumentError, 'This endpoint does not support idempotency keys' if op['idempotency'] == 'none' && key
      key ||= SecureRandom.uuid if op['idempotency'] == 'auto'
      practice = options[:practice_id] || @practice_id
      if op['practice'] != 'none'
        subject = @transport.access
        if subject['subjectType'] == 'practice'
          raise ArgumentError, 'Practice context conflicts with the API key' if practice && practice != subject['subjectId']
          practice = subject['subjectId']
        end
        raise ArgumentError, 'A platform key requires practice_id' unless practice
      elsif options[:practice_id]
        raise ArgumentError, 'This endpoint does not accept practice context'
      end
      data = wire(params, op['shape'])
      data['status'] = 'inactive' if operation == 'updatePatient' && data['status'] == 'archived'
      path = op['path'].dup
      op['ids'].each_with_index do |name,index|
        raise ArgumentError, 'A resource ID is required' if ids[index].to_s.strip.empty?
        path.sub!("{#{name}}", URI.encode_www_form_component(ids[index]).gsub('+','%20'))
      end
      path.sub!('{practiceId}', URI.encode_www_form_component(practice).gsub('+','%20')) if op['practice'] == 'path'
      data['practiceId'] = practice if %w[body query].include?(op['practice'])
      if op['practice'] == 'order'
        order_id = ids[op['ids'].index('orderId')]
        order = @transport.request('/v1/orders/' + URI.encode_www_form_component(order_id), 'GET', nil, {})
        raise ArgumentError, 'Order does not belong to the selected practice' unless order['practiceId'] == practice
        return order if operation == 'getOrder'
      end
      query = {};op['query'].each { |name| query[name] = data.delete(name) if data.key?(name) && !data[name].nil? }
      path += '?' + URI.encode_www_form(query) unless query.empty?
      headers = {};op['headers'].each { |name, header| headers[header] = options[name.to_sym] if options[name.to_sym] }
      headers['Idempotency-Key'] = key if key
      @transport.request(path,op['verb'],op['body'] ? data : nil,headers)
    end
    def iterate(operation, ids, params, options)
      Enumerator.new do |yielder|
        query = params.dup
        raise ArgumentError, 'iterate supports forward pagination' if query[:ending_before]
        loop do
          page = call(operation, ids, query, options)
          page['data'].each { |item| yielder << item }
          break unless page['hasMore']
          cursor = page['data'].last&.fetch('id')
          raise 'Pagination did not advance' if !cursor || cursor == query[:starting_after]
          query[:starting_after] = cursor
        end
      end
    end
  end
end

module Affinity
  SDK_OPERATIONS = JSON.parse(<<~'JSON').freeze
{"listPracticeLocations":{"id":"listPracticeLocations","group":"locations","method":"list","verb":"GET","path":"/v1/practices/{practiceId}/locations","ids":[],"paramsName":"LocationListParams","hasParams":true,"paramsRequired":false,"response":"ListPracticeLocationsResponse","paginated":true,"query":["limit","startingAfter","endingBefore","status"],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"status":{"wire":"status","shape":null}}}},"createPracticeLocation":{"id":"createPracticeLocation","group":"locations","method":"create","verb":"POST","path":"/v1/practices/{practiceId}/locations","ids":[],"paramsName":"LocationCreateParams","hasParams":true,"paramsRequired":true,"response":"CreatePracticeLocationResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"name":{"wire":"name","shape":null},"phone":{"wire":"phone","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"timezone":{"wire":"timezone","shape":null}}}},"getPracticeLocation":{"id":"getPracticeLocation","group":"locations","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/locations/{locationId}","ids":["locationId"],"paramsName":"LocationGetParams","hasParams":false,"paramsRequired":false,"response":"GetPracticeLocationResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"updatePracticeLocation":{"id":"updatePracticeLocation","group":"locations","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}/locations/{locationId}","ids":["locationId"],"paramsName":"LocationUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePracticeLocationResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"name":{"wire":"name","shape":null},"phone":{"wire":"phone","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"timezone":{"wire":"timezone","shape":null}}}},"archivePracticeLocation":{"id":"archivePracticeLocation","group":"locations","method":"archive","verb":"POST","path":"/v1/practices/{practiceId}/locations/{locationId}/archive","ids":["locationId"],"paramsName":"LocationArchiveParams","hasParams":false,"paramsRequired":false,"response":"ArchivePracticeLocationResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{}}},"createPlatformPracticeApiKey":{"id":"createPlatformPracticeApiKey","group":"apiKeys","method":"create","verb":"POST","path":"/v1/practices/{practiceId}/api-keys","ids":[],"paramsName":"ApiKeyCreateParams","hasParams":true,"paramsRequired":true,"response":"CreatePlatformPracticeApiKeyResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"required","shape":{"fields":{"allowed_ips":{"wire":"allowedIps","shape":{"items":null}},"expires_at":{"wire":"expiresAt","shape":null},"name":{"wire":"name","shape":null},"scopes":{"wire":"scopes","shape":{"items":null}}}}},"getAccount":{"id":"getAccount","group":"account","method":"get","verb":"GET","path":"/v1/account","ids":[],"paramsName":"AccountGetParams","hasParams":true,"paramsRequired":false,"response":"GetAccountResponse","paginated":false,"query":["orgId"],"headers":{},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{"org_id":{"wire":"orgId","shape":null}}}},"listCatalogItems":{"id":"listCatalogItems","group":"catalog.items","method":"list","verb":"GET","path":"/v1/catalog/items","ids":[],"paramsName":"CatalogItemListParams","hasParams":true,"paramsRequired":false,"response":"ListCatalogItemsResponse","paginated":true,"query":["view","relatedToCatalogItemId","catalogKind","sort","catalogItemId","availability","pharmacyIds","dosageForms","endingBefore","hideControlledSubstances","hideUnpriced","limit","orgId","practiceId","query","requirement","routes","startingAfter"],"headers":{},"body":false,"practice":"query","rootOnly":false,"idempotency":"none","shape":{"fields":{"view":{"wire":"view","shape":null},"related_to_catalog_item_id":{"wire":"relatedToCatalogItemId","shape":null},"catalog_kind":{"wire":"catalogKind","shape":null},"sort":{"wire":"sort","shape":null},"catalog_item_id":{"wire":"catalogItemId","shape":null},"availability":{"wire":"availability","shape":null},"pharmacy_ids":{"wire":"pharmacyIds","shape":null},"dosage_forms":{"wire":"dosageForms","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"hide_controlled_substances":{"wire":"hideControlledSubstances","shape":null},"hide_unpriced":{"wire":"hideUnpriced","shape":null},"limit":{"wire":"limit","shape":null},"org_id":{"wire":"orgId","shape":null},"query":{"wire":"query","shape":null},"requirement":{"wire":"requirement","shape":null},"routes":{"wire":"routes","shape":null},"starting_after":{"wire":"startingAfter","shape":null}}}},"listPharmacies":{"id":"listPharmacies","group":"pharmacies","method":"list","verb":"GET","path":"/v1/pharmacies","ids":[],"paramsName":"PharmacyListParams","hasParams":true,"paramsRequired":false,"response":"ListPharmaciesResponse","paginated":true,"query":["endingBefore","limit","orgId","pharmacyId","query","shipsToState","startingAfter"],"headers":{},"body":false,"practice":"none","rootOnly":false,"idempotency":"none","shape":{"fields":{"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null},"org_id":{"wire":"orgId","shape":null},"pharmacy_id":{"wire":"pharmacyId","shape":null},"query":{"wire":"query","shape":null},"ships_to_state":{"wire":"shipsToState","shape":null},"starting_after":{"wire":"startingAfter","shape":null}}}},"listShippingOptions":{"id":"listShippingOptions","group":"catalog.shippingOptions","method":"list","verb":"GET","path":"/v1/catalog/items/{catalogItemId}/shipping-options","ids":["catalogItemId"],"paramsName":"ShippingOptionListParams","hasParams":true,"paramsRequired":true,"response":"ListShippingOptionsResponse","paginated":false,"query":["destinationState","destinationType"],"headers":{},"body":false,"practice":"none","rootOnly":false,"idempotency":"none","shape":{"fields":{"destination_state":{"wire":"destinationState","shape":null},"destination_type":{"wire":"destinationType","shape":null}}}},"listOrders":{"id":"listOrders","group":"orders","method":"list","verb":"GET","path":"/v1/orders","ids":[],"paramsName":"OrderListParams","hasParams":true,"paramsRequired":false,"response":"ListOrdersResponse","paginated":true,"query":["query","externalOrderId","createdAfter","createdBefore","endingBefore","limit","orderId","patientId","patientExternalId","practiceId","sort","startingAfter","status"],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"query","rootOnly":false,"idempotency":"none","shape":{"fields":{"query":{"wire":"query","shape":null},"external_order_id":{"wire":"externalOrderId","shape":null},"created_after":{"wire":"createdAfter","shape":null},"created_before":{"wire":"createdBefore","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null},"order_id":{"wire":"orderId","shape":null},"patient_id":{"wire":"patientId","shape":null},"patient_external_id":{"wire":"patientExternalId","shape":null},"sort":{"wire":"sort","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"status":{"wire":"status","shape":null}}}},"createOrder":{"id":"createOrder","group":"orders","method":"create","verb":"POST","path":"/v1/orders","ids":[],"paramsName":"OrderCreateParams","hasParams":true,"paramsRequired":true,"response":"CreateOrderResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}},"otc_items":{"wire":"otcItems","shape":{"items":{"fields":{"catalog_item_id":{"wire":"catalogItemId","shape":null},"quantity":{"wire":"quantity","shape":null}}}}},"external_order_id":{"wire":"externalOrderId","shape":null},"metadata":{"wire":"metadata","shape":null},"patient_id":{"wire":"patientId","shape":null},"patient":{"wire":"patient","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"country":{"wire":"country","shape":null}}}},"clinical_profile":{"wire":"clinicalProfile","shape":{"fields":{"current_medications":{"wire":"currentMedications","shape":{"items":null}},"height_inches":{"wire":"heightInches","shape":null},"reviewed_at":{"wire":"reviewedAt","shape":null},"weight_pounds":{"wire":"weightPounds","shape":null}}}},"date_of_birth":{"wire":"dateOfBirth","shape":null},"email":{"wire":"email","shape":null},"external_id":{"wire":"externalId","shape":null},"external_identities":{"wire":"externalIdentities","shape":{"items":{"fields":{"source":{"wire":"source","shape":null},"value":{"wire":"value","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"id":{"wire":"id","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null},"recipient_name":{"wire":"recipientName","shape":null}}}}},"encounters":{"wire":"encounters","shape":{"items":{"fields":{"notes":{"wire":"notes","shape":null},"occurred_at":{"wire":"occurredAt","shape":null},"provider_name":{"wire":"providerName","shape":null},"type":{"wire":"type","shape":null}}}}},"gender":{"wire":"gender","shape":null},"location_id":{"wire":"locationId","shape":null},"metadata":{"wire":"metadata","shape":null},"medical_record_number":{"wire":"medicalRecordNumber","shape":null},"measurements":{"wire":"measurements","shape":{"items":{"fields":{"height_centimeters":{"wire":"heightCentimeters","shape":null},"recorded_at":{"wire":"recordedAt","shape":null},"source":{"wire":"source","shape":null},"weight_kilograms":{"wire":"weightKilograms","shape":null}}}}},"name":{"wire":"name","shape":{"fields":{"first":{"wire":"first","shape":null},"last":{"wire":"last","shape":null},"middle":{"wire":"middle","shape":null},"preferred":{"wire":"preferred","shape":null}}}},"phone":{"wire":"phone","shape":null},"programs":{"wire":"programs","shape":{"items":{"fields":{"ended_at":{"wire":"endedAt","shape":null},"name":{"wire":"name","shape":null},"started_at":{"wire":"startedAt","shape":null},"status":{"wire":"status","shape":null}}}}}}}},"shipping_address_id":{"wire":"shippingAddressId","shape":null},"prescriptions":{"wire":"prescriptions","shape":{"items":{"fields":{"external_prescription_id":{"wire":"externalPrescriptionId","shape":null},"clinical":{"wire":"clinical","shape":{"fields":{"compounding_reason":{"wire":"compoundingReason","shape":{"fields":{"category":{"wire":"category","shape":null},"context":{"wire":"context","shape":null}}}},"medication_review_status":{"wire":"medicationReviewStatus","shape":null},"diagnosis_review_status":{"wire":"diagnosisReviewStatus","shape":null},"current_medications":{"wire":"currentMedications","shape":{"items":null}},"diagnoses":{"wire":"diagnoses","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"display":{"wire":"display","shape":null}}}}},"observations":{"wire":"observations","shape":{"items":{"fields":{"display":{"wire":"display","shape":null},"unit":{"wire":"unit","shape":null},"value":{"wire":"value","shape":null}}}}}}}},"pharmacy_id":{"wire":"pharmacyId","shape":null},"days_supply":{"wire":"daysSupply","shape":null},"dispensing":{"wire":"dispensing","shape":{"fields":{"dispense_upon_acceptance":{"wire":"dispenseUponAcceptance","shape":null},"shipping_option_id":{"wire":"shippingOptionId","shape":null},"shipping_amount_cents":{"wire":"shippingAmountCents","shape":null},"shipping_destination_type":{"wire":"shippingDestinationType","shape":null},"pharmacy_notes":{"wire":"pharmacyNotes","shape":null},"requested_fill_date":{"wire":"requestedFillDate","shape":null},"substitution_permitted":{"wire":"substitutionPermitted","shape":null}}}},"directions":{"wire":"directions","shape":null},"medication_id":{"wire":"medicationId","shape":null},"quantity":{"wire":"quantity","shape":null},"quantity_unit":{"wire":"quantityUnit","shape":null},"refills":{"wire":"refills","shape":null},"structured_sig":{"wire":"structuredSig","shape":{"fields":{"dose":{"wire":"dose","shape":null},"dose_unit":{"wire":"doseUnit","shape":null},"duration":{"wire":"duration","shape":null},"frequency":{"wire":"frequency","shape":null},"indication":{"wire":"indication","shape":null},"max_daily_use":{"wire":"maxDailyUse","shape":null},"prn":{"wire":"prn","shape":null},"route":{"wire":"route","shape":null},"titration_schedule":{"wire":"titrationSchedule","shape":null}}}}}}}}}}},"getOrder":{"id":"getOrder","group":"orders","method":"get","verb":"GET","path":"/v1/orders/{orderId}","ids":["orderId"],"paramsName":"OrderGetParams","hasParams":false,"paramsRequired":false,"response":"GetOrderResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"order","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"cancelOrder":{"id":"cancelOrder","group":"orders","method":"cancel","verb":"POST","path":"/v1/orders/{orderId}/cancel","ids":["orderId"],"paramsName":"OrderCancelParams","hasParams":true,"paramsRequired":true,"response":"CancelOrderResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"order","rootOnly":false,"idempotency":"required","shape":{"fields":{"reason":{"wire":"reason","shape":null}}}},"actOnOrderException":{"id":"actOnOrderException","group":"orders.exceptions","method":"act","verb":"POST","path":"/v1/orders/{orderId}/exceptions/{exceptionId}/actions","ids":["orderId","exceptionId"],"paramsName":"OrderExceptionActParams","hasParams":true,"paramsRequired":true,"response":"ActOnOrderExceptionResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"order","rootOnly":false,"idempotency":"required","shape":{"fields":{"action":{"wire":"action","shape":null},"note":{"wire":"note","shape":null}}}},"listOrderEvents":{"id":"listOrderEvents","group":"orders.events","method":"list","verb":"GET","path":"/v1/orders/{orderId}/events","ids":["orderId"],"paramsName":"OrderEventListParams","hasParams":true,"paramsRequired":false,"response":"ListOrderEventsResponse","paginated":true,"query":["endingBefore","limit","startingAfter"],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"order","rootOnly":false,"idempotency":"none","shape":{"fields":{"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null}}}},"listWebhookEndpoints":{"id":"listWebhookEndpoints","group":"webhooks.endpoints","method":"list","verb":"GET","path":"/v1/webhook-endpoints","ids":[],"paramsName":"WebhookEndpointListParams","hasParams":true,"paramsRequired":false,"response":"ListWebhookEndpointsResponse","paginated":true,"query":["endingBefore","limit","startingAfter"],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null}}}},"createWebhookEndpoint":{"id":"createWebhookEndpoint","group":"webhooks.endpoints","method":"create","verb":"POST","path":"/v1/webhook-endpoints","ids":[],"paramsName":"WebhookEndpointCreateParams","hasParams":true,"paramsRequired":true,"response":"CreateWebhookEndpointResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":true,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{"practice_ids":{"wire":"practiceIds","shape":{"items":null}},"description":{"wire":"description","shape":null},"payload_style":{"wire":"payloadStyle","shape":null},"subscribed_events":{"wire":"subscribedEvents","shape":{"items":null}},"url":{"wire":"url","shape":null}}}},"updateWebhookEndpoint":{"id":"updateWebhookEndpoint","group":"webhooks.endpoints","method":"update","verb":"PATCH","path":"/v1/webhook-endpoints/{endpointId}","ids":["endpointId"],"paramsName":"WebhookEndpointUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdateWebhookEndpointResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":true,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{"practice_ids":{"wire":"practiceIds","shape":{"items":null}},"description":{"wire":"description","shape":null},"payload_style":{"wire":"payloadStyle","shape":null},"status":{"wire":"status","shape":null},"subscribed_events":{"wire":"subscribedEvents","shape":{"items":null}},"url":{"wire":"url","shape":null}}}},"deleteWebhookEndpoint":{"id":"deleteWebhookEndpoint","group":"webhooks.endpoints","method":"delete","verb":"DELETE","path":"/v1/webhook-endpoints/{endpointId}","ids":["endpointId"],"paramsName":"WebhookEndpointDeleteParams","hasParams":false,"paramsRequired":false,"response":"DeleteWebhookEndpointResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{}}},"rotateWebhookEndpointSecret":{"id":"rotateWebhookEndpointSecret","group":"webhooks.endpoints","method":"rotateSecret","verb":"POST","path":"/v1/webhook-endpoints/{endpointId}/rotate-secret","ids":["endpointId"],"paramsName":"WebhookEndpointRotateSecretParams","hasParams":false,"paramsRequired":false,"response":"RotateWebhookEndpointSecretResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{}}},"testWebhookEndpoint":{"id":"testWebhookEndpoint","group":"webhooks.endpoints","method":"test","verb":"POST","path":"/v1/webhook-endpoints/{endpointId}/test","ids":["endpointId"],"paramsName":"WebhookEndpointTestParams","hasParams":false,"paramsRequired":false,"response":"TestWebhookEndpointResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{}}},"listWebhookEvents":{"id":"listWebhookEvents","group":"webhooks.events","method":"list","verb":"GET","path":"/v1/webhook-events","ids":[],"paramsName":"WebhookEventListParams","hasParams":true,"paramsRequired":false,"response":"ListWebhookEventsResponse","paginated":true,"query":["endingBefore","limit","status","startingAfter"],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null},"status":{"wire":"status","shape":null},"starting_after":{"wire":"startingAfter","shape":null}}}},"getWebhookEvent":{"id":"getWebhookEvent","group":"webhooks.events","method":"get","verb":"GET","path":"/v1/webhook-events/{eventId}","ids":["eventId"],"paramsName":"WebhookEventGetParams","hasParams":false,"paramsRequired":false,"response":"GetWebhookEventResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{}}},"replayWebhookEvent":{"id":"replayWebhookEvent","group":"webhooks.events","method":"replay","verb":"POST","path":"/v1/webhook-events/{eventId}/replay","ids":["eventId"],"paramsName":"WebhookEventReplayParams","hasParams":false,"paramsRequired":false,"response":"ReplayWebhookEventResponse","paginated":false,"query":[],"headers":{"organization_id":"X-Affinity-Organization-Id"},"body":false,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{}}},"getOrderTestSimulation":{"id":"getOrderTestSimulation","group":"orders.testSimulation","method":"get","verb":"GET","path":"/v1/orders/{orderId}/test-simulation","ids":["orderId"],"paramsName":"OrderTestSimulationGetParams","hasParams":false,"paramsRequired":false,"response":"GetOrderTestSimulationResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"order","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"updateOrderTestSimulation":{"id":"updateOrderTestSimulation","group":"orders.testSimulation","method":"update","verb":"PUT","path":"/v1/orders/{orderId}/test-simulation","ids":["orderId"],"paramsName":"OrderTestSimulationUpdateParams","hasParams":true,"paramsRequired":true,"response":"UpdateOrderTestSimulationResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"order","rootOnly":false,"idempotency":"required","shape":{"fields":{"mode":{"wire":"mode","shape":null},"scenario":{"wire":"scenario","shape":null},"action":{"wire":"action","shape":null}}}},"retrievePrescribingOptions":{"id":"retrievePrescribingOptions","group":"catalog.prescribingOptions","method":"get","verb":"GET","path":"/v1/catalog/items/{catalogItemId}/prescribing-options","ids":["catalogItemId"],"paramsName":"PrescribingOptionGetParams","hasParams":false,"paramsRequired":false,"response":"RetrievePrescribingOptionsResponse","paginated":false,"query":["practiceId"],"headers":{},"body":false,"practice":"query","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"previewOrder":{"id":"previewOrder","group":"orders","method":"preview","verb":"POST","path":"/v1/order-previews","ids":[],"paramsName":"OrderPreviewParams","hasParams":true,"paramsRequired":true,"response":"PreviewOrderResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"body","rootOnly":false,"idempotency":"none","shape":{"fields":{"otc_items":{"wire":"otcItems","shape":{"items":{"fields":{"catalog_item_id":{"wire":"catalogItemId","shape":null},"quantity":{"wire":"quantity","shape":null}}}}},"patient_id":{"wire":"patientId","shape":null},"patient_external_id":{"wire":"patientExternalId","shape":null},"patient":{"wire":"patient","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"country":{"wire":"country","shape":null}}}},"clinical_profile":{"wire":"clinicalProfile","shape":{"fields":{"current_medications":{"wire":"currentMedications","shape":{"items":null}},"height_inches":{"wire":"heightInches","shape":null},"reviewed_at":{"wire":"reviewedAt","shape":null},"weight_pounds":{"wire":"weightPounds","shape":null}}}},"date_of_birth":{"wire":"dateOfBirth","shape":null},"email":{"wire":"email","shape":null},"external_id":{"wire":"externalId","shape":null},"external_identities":{"wire":"externalIdentities","shape":{"items":{"fields":{"source":{"wire":"source","shape":null},"value":{"wire":"value","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"id":{"wire":"id","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null},"recipient_name":{"wire":"recipientName","shape":null}}}}},"encounters":{"wire":"encounters","shape":{"items":{"fields":{"notes":{"wire":"notes","shape":null},"occurred_at":{"wire":"occurredAt","shape":null},"provider_name":{"wire":"providerName","shape":null},"type":{"wire":"type","shape":null}}}}},"gender":{"wire":"gender","shape":null},"location_id":{"wire":"locationId","shape":null},"metadata":{"wire":"metadata","shape":null},"medical_record_number":{"wire":"medicalRecordNumber","shape":null},"measurements":{"wire":"measurements","shape":{"items":{"fields":{"height_centimeters":{"wire":"heightCentimeters","shape":null},"recorded_at":{"wire":"recordedAt","shape":null},"source":{"wire":"source","shape":null},"weight_kilograms":{"wire":"weightKilograms","shape":null}}}}},"name":{"wire":"name","shape":{"fields":{"first":{"wire":"first","shape":null},"last":{"wire":"last","shape":null},"middle":{"wire":"middle","shape":null},"preferred":{"wire":"preferred","shape":null}}}},"phone":{"wire":"phone","shape":null},"programs":{"wire":"programs","shape":{"items":{"fields":{"ended_at":{"wire":"endedAt","shape":null},"name":{"wire":"name","shape":null},"started_at":{"wire":"startedAt","shape":null},"status":{"wire":"status","shape":null}}}}}}}},"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}},"shipping_address_id":{"wire":"shippingAddressId","shape":null},"external_order_id":{"wire":"externalOrderId","shape":null},"prescriptions":{"wire":"prescriptions","shape":{"items":{"fields":{"medication_id":{"wire":"medicationId","shape":null},"external_prescription_id":{"wire":"externalPrescriptionId","shape":null},"preset":{"wire":"preset","shape":null},"expected_revision":{"wire":"expectedRevision","shape":null},"overrides":{"wire":"overrides","shape":{"fields":{"sig":{"wire":"sig","shape":null},"quantity":{"wire":"quantity","shape":{"fields":{"value":{"wire":"value","shape":null},"unit":{"wire":"unit","shape":null}}}},"days_supply":{"wire":"daysSupply","shape":null},"refills":{"wire":"refills","shape":null},"clinical":{"wire":"clinical","shape":{"fields":{"compounding_reason":{"wire":"compoundingReason","shape":{"fields":{"category":{"wire":"category","shape":null},"context":{"wire":"context","shape":null}}}},"medication_review_status":{"wire":"medicationReviewStatus","shape":null},"diagnosis_review_status":{"wire":"diagnosisReviewStatus","shape":null},"current_medications":{"wire":"currentMedications","shape":{"items":null}},"diagnoses":{"wire":"diagnoses","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"display":{"wire":"display","shape":null}}}}},"observations":{"wire":"observations","shape":{"items":{"fields":{"display":{"wire":"display","shape":null},"unit":{"wire":"unit","shape":null},"value":{"wire":"value","shape":null}}}}}}}},"dispensing":{"wire":"dispensing","shape":{"fields":{"dispense_upon_acceptance":{"wire":"dispenseUponAcceptance","shape":null},"shipping_option_id":{"wire":"shippingOptionId","shape":null},"shipping_amount_cents":{"wire":"shippingAmountCents","shape":null},"shipping_destination_type":{"wire":"shippingDestinationType","shape":null},"pharmacy_notes":{"wire":"pharmacyNotes","shape":null},"requested_fill_date":{"wire":"requestedFillDate","shape":null},"substitution_permitted":{"wire":"substitutionPermitted","shape":null}}}}}}}}}}},"shipping":{"wire":"shipping","shape":{"fields":{"selection":{"wire":"selection","shape":null}}}}}}},"signOrder":{"id":"signOrder","group":"orders","method":"sign","verb":"POST","path":"/v1/orders/{orderId}/sign","ids":["orderId"],"paramsName":"OrderSignParams","hasParams":true,"paramsRequired":true,"response":"SignOrderResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}},"signature_attestation":{"wire":"signatureAttestation","shape":null},"expected_revision":{"wire":"expectedRevision","shape":null},"expected_versions":{"wire":"expectedVersions","shape":{"items":{"fields":{"prescription_id":{"wire":"prescriptionId","shape":null},"version":{"wire":"version","shape":null}}}}}}}},"signAndSubmitOrder":{"id":"signAndSubmitOrder","group":"orders","method":"signAndSubmit","verb":"POST","path":"/v1/orders/{orderId}/sign-and-submit","ids":["orderId"],"paramsName":"OrderSignAndSubmitParams","hasParams":true,"paramsRequired":true,"response":"SignAndSubmitOrderResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}},"signature_attestation":{"wire":"signatureAttestation","shape":null},"expected_revision":{"wire":"expectedRevision","shape":null},"expected_versions":{"wire":"expectedVersions","shape":{"items":{"fields":{"prescription_id":{"wire":"prescriptionId","shape":null},"version":{"wire":"version","shape":null}}}}}}}},"submitOrder":{"id":"submitOrder","group":"orders","method":"submit","verb":"POST","path":"/v1/orders/{orderId}/submit","ids":["orderId"],"paramsName":"OrderSubmitParams","hasParams":false,"paramsRequired":false,"response":"SubmitOrderResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}}}}},"rejectOrder":{"id":"rejectOrder","group":"orders","method":"reject","verb":"POST","path":"/v1/orders/{orderId}/rejection","ids":["orderId"],"paramsName":"OrderRejectParams","hasParams":true,"paramsRequired":true,"response":"RejectOrderResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}},"reason":{"wire":"reason","shape":null},"expected_revision":{"wire":"expectedRevision","shape":null},"expected_versions":{"wire":"expectedVersions","shape":{"items":{"fields":{"prescription_id":{"wire":"prescriptionId","shape":null},"version":{"wire":"version","shape":null}}}}}}}},"registerUser":{"id":"registerUser","group":"team","method":"register","verb":"POST","path":"/v1/practices/{practiceId}/users","ids":[],"paramsName":"TeamRegisterParams","hasParams":true,"paramsRequired":true,"response":"RegisterUserResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"required","shape":{"fields":{"external_id":{"wire":"externalId","shape":null},"email":{"wire":"email","shape":null},"name":{"wire":"name","shape":null},"role":{"wire":"role","shape":null},"roles":{"wire":"roles","shape":{"items":null}},"profile_details":{"wire":"profileDetails","shape":{"fields":{"first_name":{"wire":"firstName","shape":null},"middle_name":{"wire":"middleName","shape":null},"last_name":{"wire":"lastName","shape":null},"name_prefix":{"wire":"namePrefix","shape":null},"name_suffix":{"wire":"nameSuffix","shape":null},"fax":{"wire":"fax","shape":null},"specialties":{"wire":"specialties","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"description":{"wire":"description","shape":null},"primary":{"wire":"primary","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"purpose":{"wire":"purpose","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"city":{"wire":"city","shape":null},"state":{"wire":"state","shape":null},"postal_code":{"wire":"postalCode","shape":null},"country":{"wire":"country","shape":null},"phone":{"wire":"phone","shape":null},"fax":{"wire":"fax","shape":null}}}}},"other_names":{"wire":"otherNames","shape":{"items":{"fields":{"name":{"wire":"name","shape":null},"credentials":{"wire":"credentials","shape":null},"type":{"wire":"type","shape":null}}}}},"identifiers":{"wire":"identifiers","shape":{"items":{"fields":{"identifier":{"wire":"identifier","shape":null},"issuer":{"wire":"issuer","shape":null},"state":{"wire":"state","shape":null},"description":{"wire":"description","shape":null}}}}},"endpoints":{"wire":"endpoints","shape":{"items":{"fields":{"endpoint":{"wire":"endpoint","shape":null},"type":{"wire":"type","shape":null},"description":{"wire":"description","shape":null},"use":{"wire":"use","shape":null},"affiliation":{"wire":"affiliation","shape":null}}}}},"certifications":{"wire":"certifications","shape":{"items":{"fields":{"name":{"wire":"name","shape":null},"issuer":{"wire":"issuer","shape":null},"expires_at":{"wire":"expiresAt","shape":null}}}}}}}},"npi":{"wire":"npi","shape":null},"licenses":{"wire":"licenses","shape":{"items":{"fields":{"state":{"wire":"state","shape":null},"license_number":{"wire":"licenseNumber","shape":null},"expires_at":{"wire":"expiresAt","shape":null}}}}},"legal_name":{"wire":"legalName","shape":null},"display_name":{"wire":"displayName","shape":null},"credentials":{"wire":"credentials","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"phone":{"wire":"phone","shape":null},"location_ids":{"wire":"locationIds","shape":{"items":null}},"identity_attestation":{"wire":"identityAttestation","shape":null}}}},"listPatientAddresses":{"id":"listPatientAddresses","group":"patients.addresses","method":"list","verb":"GET","path":"/v1/practices/{practiceId}/patients/{patientId}/addresses","ids":["patientId"],"paramsName":"PatientAddressListParams","hasParams":true,"paramsRequired":false,"response":"ListPatientAddressesResponse","paginated":true,"query":["status","startingAfter","endingBefore","limit"],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{"status":{"wire":"status","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null}}}},"createPatientAddress":{"id":"createPatientAddress","group":"patients.addresses","method":"create","verb":"POST","path":"/v1/practices/{practiceId}/patients/{patientId}/addresses","ids":["patientId"],"paramsName":"PatientAddressCreateParams","hasParams":true,"paramsRequired":true,"response":"CreatePatientAddressResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null},"recipient_name":{"wire":"recipientName","shape":null}}}},"updatePatientAddress":{"id":"updatePatientAddress","group":"patients.addresses","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}/patients/{patientId}/addresses/{addressId}","ids":["patientId","addressId"],"paramsName":"PatientAddressUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePatientAddressResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"recipient_name":{"wire":"recipientName","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null}}}},"archivePatientAddress":{"id":"archivePatientAddress","group":"patients.addresses","method":"archive","verb":"DELETE","path":"/v1/practices/{practiceId}/patients/{patientId}/addresses/{addressId}","ids":["patientId","addressId"],"paramsName":"PatientAddressArchiveParams","hasParams":false,"paramsRequired":false,"response":"ArchivePatientAddressResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{}}},"setDefaultPatientAddress":{"id":"setDefaultPatientAddress","group":"patients.addresses","method":"setDefault","verb":"PUT","path":"/v1/practices/{practiceId}/patients/{patientId}/addresses/{addressId}/default","ids":["patientId","addressId"],"paramsName":"PatientAddressSetDefaultParams","hasParams":false,"paramsRequired":false,"response":"SetDefaultPatientAddressResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{}}},"invitePracticeTeamPerson":{"id":"invitePracticeTeamPerson","group":"team.invitations","method":"create","verb":"POST","path":"/v1/practices/{practiceId}/team/invitations","ids":[],"paramsName":"TeamInvitationCreateParams","hasParams":true,"paramsRequired":true,"response":"InvitePracticeTeamPersonResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"required","shape":{"fields":{"external_id":{"wire":"externalId","shape":null},"email":{"wire":"email","shape":null},"name":{"wire":"name","shape":null},"role":{"wire":"role","shape":null},"roles":{"wire":"roles","shape":{"items":null}},"profile_details":{"wire":"profileDetails","shape":{"fields":{"first_name":{"wire":"firstName","shape":null},"middle_name":{"wire":"middleName","shape":null},"last_name":{"wire":"lastName","shape":null},"name_prefix":{"wire":"namePrefix","shape":null},"name_suffix":{"wire":"nameSuffix","shape":null},"fax":{"wire":"fax","shape":null},"specialties":{"wire":"specialties","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"description":{"wire":"description","shape":null},"primary":{"wire":"primary","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"purpose":{"wire":"purpose","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"city":{"wire":"city","shape":null},"state":{"wire":"state","shape":null},"postal_code":{"wire":"postalCode","shape":null},"country":{"wire":"country","shape":null},"phone":{"wire":"phone","shape":null},"fax":{"wire":"fax","shape":null}}}}},"other_names":{"wire":"otherNames","shape":{"items":{"fields":{"name":{"wire":"name","shape":null},"credentials":{"wire":"credentials","shape":null},"type":{"wire":"type","shape":null}}}}},"identifiers":{"wire":"identifiers","shape":{"items":{"fields":{"identifier":{"wire":"identifier","shape":null},"issuer":{"wire":"issuer","shape":null},"state":{"wire":"state","shape":null},"description":{"wire":"description","shape":null}}}}},"endpoints":{"wire":"endpoints","shape":{"items":{"fields":{"endpoint":{"wire":"endpoint","shape":null},"type":{"wire":"type","shape":null},"description":{"wire":"description","shape":null},"use":{"wire":"use","shape":null},"affiliation":{"wire":"affiliation","shape":null}}}}},"certifications":{"wire":"certifications","shape":{"items":{"fields":{"name":{"wire":"name","shape":null},"issuer":{"wire":"issuer","shape":null},"expires_at":{"wire":"expiresAt","shape":null}}}}}}}},"npi":{"wire":"npi","shape":null},"licenses":{"wire":"licenses","shape":{"items":{"fields":{"state":{"wire":"state","shape":null},"license_number":{"wire":"licenseNumber","shape":null},"expires_at":{"wire":"expiresAt","shape":null}}}}},"legal_name":{"wire":"legalName","shape":null},"display_name":{"wire":"displayName","shape":null},"credentials":{"wire":"credentials","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"phone":{"wire":"phone","shape":null},"location_ids":{"wire":"locationIds","shape":{"items":null}}}}},"listPracticeTeamInvitations":{"id":"listPracticeTeamInvitations","group":"team.invitations","method":"list","verb":"GET","path":"/v1/practices/{practiceId}/team/invitations","ids":[],"paramsName":"TeamInvitationListParams","hasParams":true,"paramsRequired":false,"response":"ListPracticeTeamInvitationsResponse","paginated":true,"query":["limit","startingAfter","endingBefore","status","email","externalId"],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"status":{"wire":"status","shape":null},"email":{"wire":"email","shape":null},"external_id":{"wire":"externalId","shape":null}}}},"getPracticeTeam":{"id":"getPracticeTeam","group":"team","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/team","ids":[],"paramsName":"TeamGetParams","hasParams":false,"paramsRequired":false,"response":"GetPracticeTeamResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"listPracticeTeamMembers":{"id":"listPracticeTeamMembers","group":"team.members","method":"list","verb":"GET","path":"/v1/practices/{practiceId}/team/members","ids":[],"paramsName":"TeamMemberListParams","hasParams":true,"paramsRequired":false,"response":"ListPracticeTeamMembersResponse","paginated":true,"query":["limit","startingAfter","endingBefore","search","role","status"],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"search":{"wire":"search","shape":null},"role":{"wire":"role","shape":null},"status":{"wire":"status","shape":null}}}},"listPracticeTeamPrescribers":{"id":"listPracticeTeamPrescribers","group":"team.prescribers","method":"list","verb":"GET","path":"/v1/practices/{practiceId}/team/prescribers","ids":[],"paramsName":"TeamPrescriberListParams","hasParams":true,"paramsRequired":false,"response":"ListPracticeTeamPrescribersResponse","paginated":true,"query":["limit","startingAfter","endingBefore","search","npi","state","status"],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"search":{"wire":"search","shape":null},"npi":{"wire":"npi","shape":null},"state":{"wire":"state","shape":null},"status":{"wire":"status","shape":null}}}},"getPracticeTeamMember":{"id":"getPracticeTeamMember","group":"team.members","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/team/members/{memberId}","ids":["memberId"],"paramsName":"TeamMemberGetParams","hasParams":false,"paramsRequired":false,"response":"GetPracticeTeamMemberResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"updatePracticeTeamMember":{"id":"updatePracticeTeamMember","group":"team.members","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}/team/members/{memberId}","ids":["memberId"],"paramsName":"TeamMemberUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePracticeTeamMemberResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"role":{"wire":"role","shape":null},"roles":{"wire":"roles","shape":{"items":null}},"status":{"wire":"status","shape":null},"location_ids":{"wire":"locationIds","shape":{"items":null}}}}},"getPracticeTeamPrescriber":{"id":"getPracticeTeamPrescriber","group":"team.prescribers","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/team/prescribers/{prescriberId}","ids":["prescriberId"],"paramsName":"TeamPrescriberGetParams","hasParams":false,"paramsRequired":false,"response":"GetPracticeTeamPrescriberResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"updatePracticeTeamPrescriber":{"id":"updatePracticeTeamPrescriber","group":"team.prescribers","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}/team/prescribers/{prescriberId}","ids":["prescriberId"],"paramsName":"TeamPrescriberUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePracticeTeamPrescriberResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"display_name":{"wire":"displayName","shape":null},"legal_name":{"wire":"legalName","shape":null},"credentials":{"wire":"credentials","shape":null},"phone":{"wire":"phone","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"practice_status":{"wire":"practiceStatus","shape":null}}}},"createPracticeTeamLicense":{"id":"createPracticeTeamLicense","group":"team.prescribers.licenses","method":"create","verb":"POST","path":"/v1/practices/{practiceId}/team/prescribers/{prescriberId}/licenses","ids":["prescriberId"],"paramsName":"TeamPrescriberLicenseCreateParams","hasParams":true,"paramsRequired":true,"response":"CreatePracticeTeamLicenseResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"state":{"wire":"state","shape":null},"license_number":{"wire":"licenseNumber","shape":null},"expires_at":{"wire":"expiresAt","shape":null}}}},"updatePracticeTeamLicense":{"id":"updatePracticeTeamLicense","group":"team.prescribers.licenses","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}/team/prescribers/{prescriberId}/licenses/{licenseId}","ids":["prescriberId","licenseId"],"paramsName":"TeamPrescriberLicenseUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePracticeTeamLicenseResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"state":{"wire":"state","shape":null},"license_number":{"wire":"licenseNumber","shape":null},"expires_at":{"wire":"expiresAt","shape":null}}}},"getPracticeTeamInvitation":{"id":"getPracticeTeamInvitation","group":"team.invitations","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/team/invitations/{invitationId}","ids":["invitationId"],"paramsName":"TeamInvitationGetParams","hasParams":false,"paramsRequired":false,"response":"GetPracticeTeamInvitationResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"revokePracticeTeamInvitation":{"id":"revokePracticeTeamInvitation","group":"team.invitations","method":"revoke","verb":"DELETE","path":"/v1/practices/{practiceId}/team/invitations/{invitationId}","ids":["invitationId"],"paramsName":"TeamInvitationRevokeParams","hasParams":false,"paramsRequired":false,"response":"RevokePracticeTeamInvitationResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"required","shape":{"fields":{}}},"resendPracticeTeamInvitation":{"id":"resendPracticeTeamInvitation","group":"team.invitations","method":"resend","verb":"POST","path":"/v1/practices/{practiceId}/team/invitations/{invitationId}/resend","ids":["invitationId"],"paramsName":"TeamInvitationResendParams","hasParams":false,"paramsRequired":false,"response":"ResendPracticeTeamInvitationResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"path","rootOnly":false,"idempotency":"required","shape":{"fields":{}}},"getApiAccess":{"id":"getApiAccess","group":"apiKeys","method":"getAccess","verb":"GET","path":"/v1/auth/access","ids":[],"paramsName":"ApiKeyGetAccessParams","hasParams":false,"paramsRequired":false,"response":"GetApiAccessResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"none","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"listPractices":{"id":"listPractices","group":"practices","method":"list","verb":"GET","path":"/v1/practices","ids":[],"paramsName":"PracticeListParams","hasParams":true,"paramsRequired":false,"response":"ListPracticesResponse","paginated":true,"query":["search","endingBefore","limit","startingAfter"],"headers":{},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{"search":{"wire":"search","shape":null},"ending_before":{"wire":"endingBefore","shape":null},"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null}}}},"createPractice":{"id":"createPractice","group":"practices","method":"create","verb":"POST","path":"/v1/practices","ids":[],"paramsName":"PracticeCreateParams","hasParams":true,"paramsRequired":true,"response":"CreatePracticeResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"none","rootOnly":true,"idempotency":"auto","shape":{"fields":{"live_enabled":{"wire":"liveEnabled","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"attestations":{"wire":"attestations","shape":{"fields":{"authorized_practice_relationship":{"wire":"authorizedPracticeRelationship","shape":null},"authorized_phi_transfer":{"wire":"authorizedPhiTransfer","shape":null},"minimum_necessary_phi":{"wire":"minimumNecessaryPhi","shape":null},"provider_data_accuracy":{"wire":"providerDataAccuracy","shape":null}}}},"compliance_contact":{"wire":"complianceContact","shape":{"fields":{"email":{"wire":"email","shape":null},"name":{"wire":"name","shape":null},"phone":{"wire":"phone","shape":null}}}},"external_id":{"wire":"externalId","shape":null},"legal_name":{"wire":"legalName","shape":null},"metadata":{"wire":"metadata","shape":null},"name":{"wire":"name","shape":null},"prescribers":{"wire":"prescribers","shape":{"items":{"fields":{"credentials":{"wire":"credentials","shape":null},"license_states":{"wire":"licenseStates","shape":{"items":null}},"name":{"wire":"name","shape":null},"npi":{"wire":"npi","shape":null}}}}},"primary_contact":{"wire":"primaryContact","shape":{"fields":{"email":{"wire":"email","shape":null},"name":{"wire":"name","shape":null},"phone":{"wire":"phone","shape":null}}}},"support_email":{"wire":"supportEmail","shape":null},"support_phone":{"wire":"supportPhone","shape":null},"timezone":{"wire":"timezone","shape":null}}}},"getPractice":{"id":"getPractice","group":"practices","method":"get","verb":"GET","path":"/v1/practices/{practiceId}","ids":["practiceId"],"paramsName":"PracticeGetParams","hasParams":false,"paramsRequired":false,"response":"GetPracticeResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{}}},"updatePractice":{"id":"updatePractice","group":"practices","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}","ids":["practiceId"],"paramsName":"PracticeUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePracticeResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"none","rootOnly":true,"idempotency":"auto","shape":{"fields":{"live_enabled":{"wire":"liveEnabled","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"attestations":{"wire":"attestations","shape":{"fields":{"authorized_practice_relationship":{"wire":"authorizedPracticeRelationship","shape":null},"authorized_phi_transfer":{"wire":"authorizedPhiTransfer","shape":null},"minimum_necessary_phi":{"wire":"minimumNecessaryPhi","shape":null},"provider_data_accuracy":{"wire":"providerDataAccuracy","shape":null}}}},"compliance_contact":{"wire":"complianceContact","shape":{"fields":{"email":{"wire":"email","shape":null},"name":{"wire":"name","shape":null},"phone":{"wire":"phone","shape":null}}}},"external_id":{"wire":"externalId","shape":null},"legal_name":{"wire":"legalName","shape":null},"metadata":{"wire":"metadata","shape":null},"name":{"wire":"name","shape":null},"prescribers":{"wire":"prescribers","shape":{"items":{"fields":{"credentials":{"wire":"credentials","shape":null},"license_states":{"wire":"licenseStates","shape":{"items":null}},"name":{"wire":"name","shape":null},"npi":{"wire":"npi","shape":null}}}}},"primary_contact":{"wire":"primaryContact","shape":{"fields":{"email":{"wire":"email","shape":null},"name":{"wire":"name","shape":null},"phone":{"wire":"phone","shape":null}}}},"support_email":{"wire":"supportEmail","shape":null},"support_phone":{"wire":"supportPhone","shape":null},"timezone":{"wire":"timezone","shape":null}}}},"listPatients":{"id":"listPatients","group":"patients","method":"list","verb":"GET","path":"/v1/practices/{practiceId}/patients","ids":[],"paramsName":"PatientListParams","hasParams":true,"paramsRequired":false,"response":"ListPatientsResponse","paginated":true,"query":["endingBefore","externalId","externalIdentitySource","externalIdentityValue","gender","lastOrderAfter","lastOrderBefore","limit","program","query","sort","startingAfter","states","status"],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{"ending_before":{"wire":"endingBefore","shape":null},"external_id":{"wire":"externalId","shape":null},"external_identity_source":{"wire":"externalIdentitySource","shape":null},"external_identity_value":{"wire":"externalIdentityValue","shape":null},"gender":{"wire":"gender","shape":null},"last_order_after":{"wire":"lastOrderAfter","shape":null},"last_order_before":{"wire":"lastOrderBefore","shape":null},"limit":{"wire":"limit","shape":null},"program":{"wire":"program","shape":null},"query":{"wire":"query","shape":null},"sort":{"wire":"sort","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"states":{"wire":"states","shape":null},"status":{"wire":"status","shape":null}}}},"createPatient":{"id":"createPatient","group":"patients","method":"create","verb":"POST","path":"/v1/practices/{practiceId}/patients","ids":[],"paramsName":"PatientCreateParams","hasParams":true,"paramsRequired":true,"response":"CreatePatientResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"country":{"wire":"country","shape":null}}}},"clinical_profile":{"wire":"clinicalProfile","shape":{"fields":{"current_medications":{"wire":"currentMedications","shape":{"items":null}},"height_inches":{"wire":"heightInches","shape":null},"reviewed_at":{"wire":"reviewedAt","shape":null},"weight_pounds":{"wire":"weightPounds","shape":null}}}},"date_of_birth":{"wire":"dateOfBirth","shape":null},"email":{"wire":"email","shape":null},"external_id":{"wire":"externalId","shape":null},"external_identities":{"wire":"externalIdentities","shape":{"items":{"fields":{"source":{"wire":"source","shape":null},"value":{"wire":"value","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"id":{"wire":"id","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null},"recipient_name":{"wire":"recipientName","shape":null}}}}},"encounters":{"wire":"encounters","shape":{"items":{"fields":{"notes":{"wire":"notes","shape":null},"occurred_at":{"wire":"occurredAt","shape":null},"provider_name":{"wire":"providerName","shape":null},"type":{"wire":"type","shape":null}}}}},"gender":{"wire":"gender","shape":null},"location_id":{"wire":"locationId","shape":null},"metadata":{"wire":"metadata","shape":null},"medical_record_number":{"wire":"medicalRecordNumber","shape":null},"measurements":{"wire":"measurements","shape":{"items":{"fields":{"height_centimeters":{"wire":"heightCentimeters","shape":null},"recorded_at":{"wire":"recordedAt","shape":null},"source":{"wire":"source","shape":null},"weight_kilograms":{"wire":"weightKilograms","shape":null}}}}},"name":{"wire":"name","shape":{"fields":{"first":{"wire":"first","shape":null},"last":{"wire":"last","shape":null},"middle":{"wire":"middle","shape":null},"preferred":{"wire":"preferred","shape":null}}}},"phone":{"wire":"phone","shape":null},"programs":{"wire":"programs","shape":{"items":{"fields":{"ended_at":{"wire":"endedAt","shape":null},"name":{"wire":"name","shape":null},"started_at":{"wire":"startedAt","shape":null},"status":{"wire":"status","shape":null}}}}}}}},"getPatient":{"id":"getPatient","group":"patients","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/patients/{patientId}","ids":["patientId"],"paramsName":"PatientGetParams","hasParams":false,"paramsRequired":false,"response":"GetPatientResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"deletePatient":{"id":"deletePatient","group":"patients","method":"delete","verb":"DELETE","path":"/v1/practices/{practiceId}/patients/{patientId}","ids":["patientId"],"paramsName":"PatientDeleteParams","hasParams":false,"paramsRequired":false,"response":"DeletePatientResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{}}},"updatePatient":{"id":"updatePatient","group":"patients","method":"update","verb":"PATCH","path":"/v1/practices/{practiceId}/patients/{patientId}","ids":["patientId"],"paramsName":"PatientUpdateParams","hasParams":true,"paramsRequired":false,"response":"UpdatePatientResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"path","rootOnly":false,"idempotency":"auto","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"country":{"wire":"country","shape":null}}}},"clinical_profile":{"wire":"clinicalProfile","shape":{"fields":{"current_medications":{"wire":"currentMedications","shape":{"items":null}},"height_inches":{"wire":"heightInches","shape":null},"reviewed_at":{"wire":"reviewedAt","shape":null},"weight_pounds":{"wire":"weightPounds","shape":null}}}},"date_of_birth":{"wire":"dateOfBirth","shape":null},"email":{"wire":"email","shape":null},"external_id":{"wire":"externalId","shape":null},"external_identities":{"wire":"externalIdentities","shape":{"items":{"fields":{"source":{"wire":"source","shape":null},"value":{"wire":"value","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"id":{"wire":"id","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null},"recipient_name":{"wire":"recipientName","shape":null}}}}},"encounters":{"wire":"encounters","shape":{"items":{"fields":{"notes":{"wire":"notes","shape":null},"occurred_at":{"wire":"occurredAt","shape":null},"provider_name":{"wire":"providerName","shape":null},"type":{"wire":"type","shape":null}}}}},"gender":{"wire":"gender","shape":null},"location_id":{"wire":"locationId","shape":null},"metadata":{"wire":"metadata","shape":null},"medical_record_number":{"wire":"medicalRecordNumber","shape":null},"measurements":{"wire":"measurements","shape":{"items":{"fields":{"height_centimeters":{"wire":"heightCentimeters","shape":null},"recorded_at":{"wire":"recordedAt","shape":null},"source":{"wire":"source","shape":null},"weight_kilograms":{"wire":"weightKilograms","shape":null}}}}},"name":{"wire":"name","shape":{"fields":{"first":{"wire":"first","shape":null},"last":{"wire":"last","shape":null},"middle":{"wire":"middle","shape":null},"preferred":{"wire":"preferred","shape":null}}}},"programs":{"wire":"programs","shape":{"items":{"fields":{"ended_at":{"wire":"endedAt","shape":null},"name":{"wire":"name","shape":null},"started_at":{"wire":"startedAt","shape":null},"status":{"wire":"status","shape":null}}}}},"phone":{"wire":"phone","shape":null},"status":{"wire":"status","shape":null}}}},"getPatientAllergies":{"id":"getPatientAllergies","group":"patients.allergies","method":"get","verb":"GET","path":"/v1/practices/{practiceId}/patients/{patientId}/allergies","ids":["patientId"],"paramsName":"PatientAllergyGetParams","hasParams":false,"paramsRequired":false,"response":"GetPatientAllergiesResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":false,"practice":"path","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"replacePatientAllergies":{"id":"replacePatientAllergies","group":"patients.allergies","method":"replace","verb":"PUT","path":"/v1/practices/{practiceId}/patients/{patientId}/allergies","ids":["patientId"],"paramsName":"PatientAllergyReplaceParams","hasParams":true,"paramsRequired":true,"response":"ReplacePatientAllergiesResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"path","rootOnly":false,"idempotency":"required","shape":{"fields":{"allergies":{"wire":"allergies","shape":{"items":{"fields":{"category":{"wire":"category","shape":null},"code":{"wire":"code","shape":null},"code_system":{"wire":"codeSystem","shape":null},"reactions":{"wire":"reactions","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"code_system":{"wire":"codeSystem","shape":null},"display":{"wire":"display","shape":null}}}}},"severity":{"wire":"severity","shape":null},"source":{"wire":"source","shape":null},"substance":{"wire":"substance","shape":null},"type":{"wire":"type","shape":null},"verification_status":{"wire":"verificationStatus","shape":null}}}}},"review_status":{"wire":"reviewStatus","shape":null}}}},"addOrderPrescription":{"id":"addOrderPrescription","group":"orders.prescriptions","method":"add","verb":"POST","path":"/v1/orders/{orderId}/prescriptions","ids":["orderId"],"paramsName":"OrderPrescriptionAddParams","hasParams":true,"paramsRequired":true,"response":"AddOrderPrescriptionResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"metadata":{"wire":"metadata","shape":null},"expected_revision":{"wire":"expectedRevision","shape":null},"expected_versions":{"wire":"expectedVersions","shape":{"items":{"fields":{"prescription_id":{"wire":"prescriptionId","shape":null},"version":{"wire":"version","shape":null}}}}},"prescription":{"wire":"prescription","shape":{"fields":{"external_prescription_id":{"wire":"externalPrescriptionId","shape":null},"clinical":{"wire":"clinical","shape":{"fields":{"compounding_reason":{"wire":"compoundingReason","shape":{"fields":{"category":{"wire":"category","shape":null},"context":{"wire":"context","shape":null}}}},"medication_review_status":{"wire":"medicationReviewStatus","shape":null},"diagnosis_review_status":{"wire":"diagnosisReviewStatus","shape":null},"current_medications":{"wire":"currentMedications","shape":{"items":null}},"diagnoses":{"wire":"diagnoses","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"display":{"wire":"display","shape":null}}}}},"observations":{"wire":"observations","shape":{"items":{"fields":{"display":{"wire":"display","shape":null},"unit":{"wire":"unit","shape":null},"value":{"wire":"value","shape":null}}}}}}}},"pharmacy_id":{"wire":"pharmacyId","shape":null},"days_supply":{"wire":"daysSupply","shape":null},"dispensing":{"wire":"dispensing","shape":{"fields":{"dispense_upon_acceptance":{"wire":"dispenseUponAcceptance","shape":null},"shipping_option_id":{"wire":"shippingOptionId","shape":null},"shipping_amount_cents":{"wire":"shippingAmountCents","shape":null},"shipping_destination_type":{"wire":"shippingDestinationType","shape":null},"pharmacy_notes":{"wire":"pharmacyNotes","shape":null},"requested_fill_date":{"wire":"requestedFillDate","shape":null},"substitution_permitted":{"wire":"substitutionPermitted","shape":null}}}},"directions":{"wire":"directions","shape":null},"medication_id":{"wire":"medicationId","shape":null},"quantity":{"wire":"quantity","shape":null},"quantity_unit":{"wire":"quantityUnit","shape":null},"refills":{"wire":"refills","shape":null},"structured_sig":{"wire":"structuredSig","shape":{"fields":{"dose":{"wire":"dose","shape":null},"dose_unit":{"wire":"doseUnit","shape":null},"duration":{"wire":"duration","shape":null},"frequency":{"wire":"frequency","shape":null},"indication":{"wire":"indication","shape":null},"max_daily_use":{"wire":"maxDailyUse","shape":null},"prn":{"wire":"prn","shape":null},"route":{"wire":"route","shape":null},"titration_schedule":{"wire":"titrationSchedule","shape":null}}}}}}}}}},"updateOrderPrescription":{"id":"updateOrderPrescription","group":"orders.prescriptions","method":"update","verb":"PATCH","path":"/v1/orders/{orderId}/prescriptions/{prescriptionId}","ids":["orderId","prescriptionId"],"paramsName":"OrderPrescriptionUpdateParams","hasParams":true,"paramsRequired":true,"response":"UpdateOrderPrescriptionResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"metadata":{"wire":"metadata","shape":null},"expected_revision":{"wire":"expectedRevision","shape":null},"expected_versions":{"wire":"expectedVersions","shape":{"items":{"fields":{"prescription_id":{"wire":"prescriptionId","shape":null},"version":{"wire":"version","shape":null}}}}},"prescription":{"wire":"prescription","shape":{"fields":{"clinical":{"wire":"clinical","shape":{"fields":{"compounding_reason":{"wire":"compoundingReason","shape":{"fields":{"category":{"wire":"category","shape":null},"context":{"wire":"context","shape":null}}}},"medication_review_status":{"wire":"medicationReviewStatus","shape":null},"diagnosis_review_status":{"wire":"diagnosisReviewStatus","shape":null},"current_medications":{"wire":"currentMedications","shape":{"items":null}},"diagnoses":{"wire":"diagnoses","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"display":{"wire":"display","shape":null}}}}},"observations":{"wire":"observations","shape":{"items":{"fields":{"display":{"wire":"display","shape":null},"unit":{"wire":"unit","shape":null},"value":{"wire":"value","shape":null}}}}}}}},"pharmacy_id":{"wire":"pharmacyId","shape":null},"days_supply":{"wire":"daysSupply","shape":null},"dispensing":{"wire":"dispensing","shape":{"fields":{"dispense_upon_acceptance":{"wire":"dispenseUponAcceptance","shape":null},"shipping_option_id":{"wire":"shippingOptionId","shape":null},"shipping_amount_cents":{"wire":"shippingAmountCents","shape":null},"shipping_destination_type":{"wire":"shippingDestinationType","shape":null},"pharmacy_notes":{"wire":"pharmacyNotes","shape":null},"requested_fill_date":{"wire":"requestedFillDate","shape":null},"substitution_permitted":{"wire":"substitutionPermitted","shape":null}}}},"directions":{"wire":"directions","shape":null},"medication_id":{"wire":"medicationId","shape":null},"quantity":{"wire":"quantity","shape":null},"quantity_unit":{"wire":"quantityUnit","shape":null},"refills":{"wire":"refills","shape":null},"structured_sig":{"wire":"structuredSig","shape":{"fields":{"dose":{"wire":"dose","shape":null},"dose_unit":{"wire":"doseUnit","shape":null},"duration":{"wire":"duration","shape":null},"frequency":{"wire":"frequency","shape":null},"indication":{"wire":"indication","shape":null},"max_daily_use":{"wire":"maxDailyUse","shape":null},"prn":{"wire":"prn","shape":null},"route":{"wire":"route","shape":null},"titration_schedule":{"wire":"titrationSchedule","shape":null}}}}}}}}}},"createOrderBatch":{"id":"createOrderBatch","group":"orders.batches","method":"create","verb":"POST","path":"/v1/order-batches","ids":[],"paramsName":"OrderBatchCreateParams","hasParams":true,"paramsRequired":true,"response":"CreateOrderBatchResponse","paginated":false,"query":[],"headers":{"actor_id":"Affinity-Actor-Id","actor_type":"Affinity-Actor-Type"},"body":true,"practice":"body","rootOnly":false,"idempotency":"required","shape":{"fields":{"user_id":{"wire":"userId","shape":null},"prescriber":{"wire":"prescriber","shape":{"fields":{"id":{"wire":"id","shape":null},"npi":{"wire":"npi","shape":null},"external_id":{"wire":"externalId","shape":null},"profile":{"wire":"profile","shape":{"fields":{"email":{"wire":"email","shape":null},"phone":{"wire":"phone","shape":null}}}}}}},"orders":{"wire":"orders","shape":{"items":{"fields":{"otc_items":{"wire":"otcItems","shape":{"items":{"fields":{"catalog_item_id":{"wire":"catalogItemId","shape":null},"quantity":{"wire":"quantity","shape":null}}}}},"external_order_id":{"wire":"externalOrderId","shape":null},"metadata":{"wire":"metadata","shape":null},"patient_id":{"wire":"patientId","shape":null},"patient":{"wire":"patient","shape":{"fields":{"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null},"country":{"wire":"country","shape":null}}}},"clinical_profile":{"wire":"clinicalProfile","shape":{"fields":{"current_medications":{"wire":"currentMedications","shape":{"items":null}},"height_inches":{"wire":"heightInches","shape":null},"reviewed_at":{"wire":"reviewedAt","shape":null},"weight_pounds":{"wire":"weightPounds","shape":null}}}},"date_of_birth":{"wire":"dateOfBirth","shape":null},"email":{"wire":"email","shape":null},"external_id":{"wire":"externalId","shape":null},"external_identities":{"wire":"externalIdentities","shape":{"items":{"fields":{"source":{"wire":"source","shape":null},"value":{"wire":"value","shape":null}}}}},"addresses":{"wire":"addresses","shape":{"items":{"fields":{"id":{"wire":"id","shape":null},"address":{"wire":"address","shape":{"fields":{"city":{"wire":"city","shape":null},"country":{"wire":"country","shape":null},"line1":{"wire":"line1","shape":null},"line2":{"wire":"line2","shape":null},"postal_code":{"wire":"postalCode","shape":null},"state":{"wire":"state","shape":null}}}},"label":{"wire":"label","shape":null},"preferred_shipping":{"wire":"preferredShipping","shape":null},"recipient_name":{"wire":"recipientName","shape":null}}}}},"encounters":{"wire":"encounters","shape":{"items":{"fields":{"notes":{"wire":"notes","shape":null},"occurred_at":{"wire":"occurredAt","shape":null},"provider_name":{"wire":"providerName","shape":null},"type":{"wire":"type","shape":null}}}}},"gender":{"wire":"gender","shape":null},"location_id":{"wire":"locationId","shape":null},"metadata":{"wire":"metadata","shape":null},"medical_record_number":{"wire":"medicalRecordNumber","shape":null},"measurements":{"wire":"measurements","shape":{"items":{"fields":{"height_centimeters":{"wire":"heightCentimeters","shape":null},"recorded_at":{"wire":"recordedAt","shape":null},"source":{"wire":"source","shape":null},"weight_kilograms":{"wire":"weightKilograms","shape":null}}}}},"name":{"wire":"name","shape":{"fields":{"first":{"wire":"first","shape":null},"last":{"wire":"last","shape":null},"middle":{"wire":"middle","shape":null},"preferred":{"wire":"preferred","shape":null}}}},"phone":{"wire":"phone","shape":null},"programs":{"wire":"programs","shape":{"items":{"fields":{"ended_at":{"wire":"endedAt","shape":null},"name":{"wire":"name","shape":null},"started_at":{"wire":"startedAt","shape":null},"status":{"wire":"status","shape":null}}}}}}}},"shipping_address_id":{"wire":"shippingAddressId","shape":null},"prescriptions":{"wire":"prescriptions","shape":{"items":{"fields":{"external_prescription_id":{"wire":"externalPrescriptionId","shape":null},"clinical":{"wire":"clinical","shape":{"fields":{"compounding_reason":{"wire":"compoundingReason","shape":{"fields":{"category":{"wire":"category","shape":null},"context":{"wire":"context","shape":null}}}},"medication_review_status":{"wire":"medicationReviewStatus","shape":null},"diagnosis_review_status":{"wire":"diagnosisReviewStatus","shape":null},"current_medications":{"wire":"currentMedications","shape":{"items":null}},"diagnoses":{"wire":"diagnoses","shape":{"items":{"fields":{"code":{"wire":"code","shape":null},"display":{"wire":"display","shape":null}}}}},"observations":{"wire":"observations","shape":{"items":{"fields":{"display":{"wire":"display","shape":null},"unit":{"wire":"unit","shape":null},"value":{"wire":"value","shape":null}}}}}}}},"pharmacy_id":{"wire":"pharmacyId","shape":null},"days_supply":{"wire":"daysSupply","shape":null},"dispensing":{"wire":"dispensing","shape":{"fields":{"dispense_upon_acceptance":{"wire":"dispenseUponAcceptance","shape":null},"shipping_option_id":{"wire":"shippingOptionId","shape":null},"shipping_amount_cents":{"wire":"shippingAmountCents","shape":null},"shipping_destination_type":{"wire":"shippingDestinationType","shape":null},"pharmacy_notes":{"wire":"pharmacyNotes","shape":null},"requested_fill_date":{"wire":"requestedFillDate","shape":null},"substitution_permitted":{"wire":"substitutionPermitted","shape":null}}}},"directions":{"wire":"directions","shape":null},"medication_id":{"wire":"medicationId","shape":null},"quantity":{"wire":"quantity","shape":null},"quantity_unit":{"wire":"quantityUnit","shape":null},"refills":{"wire":"refills","shape":null},"structured_sig":{"wire":"structuredSig","shape":{"fields":{"dose":{"wire":"dose","shape":null},"dose_unit":{"wire":"doseUnit","shape":null},"duration":{"wire":"duration","shape":null},"frequency":{"wire":"frequency","shape":null},"indication":{"wire":"indication","shape":null},"max_daily_use":{"wire":"maxDailyUse","shape":null},"prn":{"wire":"prn","shape":null},"route":{"wire":"route","shape":null},"titration_schedule":{"wire":"titrationSchedule","shape":null}}}}}}}}}}}}}}},"platform.public-api.selling-prices.readSellingPrice":{"id":"platform.public-api.selling-prices.readSellingPrice","group":"catalog.sellingPrices","method":"get","verb":"GET","path":"/v1/catalog/items/{catalogItemId}/selling-price","ids":["catalogItemId"],"paramsName":"SellingPriceGetParams","hasParams":false,"paramsRequired":false,"response":"PlatformPublicApiSellingPricesReadSellingPriceResponse","paginated":false,"query":["practiceId"],"headers":{},"body":false,"practice":"query","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"platform.public-api.selling-prices.readPresentationPrice":{"id":"platform.public-api.selling-prices.readPresentationPrice","group":"catalog.presentationPrices","method":"get","verb":"GET","path":"/v1/catalog/items/{catalogItemId}/presentation-price","ids":["catalogItemId"],"paramsName":"PresentationPriceGetParams","hasParams":false,"paramsRequired":false,"response":"PlatformPublicApiSellingPricesReadPresentationPriceResponse","paginated":false,"query":["practiceId"],"headers":{},"body":false,"practice":"query","rootOnly":false,"idempotency":"none","shape":{"fields":{}}},"listWebhookGrants":{"id":"listWebhookGrants","group":"webhooks.grants","method":"list","verb":"GET","path":"/v1/webhook-grants","ids":[],"paramsName":"WebhookGrantListParams","hasParams":true,"paramsRequired":false,"response":"ListWebhookGrantsResponse","paginated":true,"query":["limit","startingAfter","endingBefore"],"headers":{},"body":false,"practice":"none","rootOnly":true,"idempotency":"none","shape":{"fields":{"limit":{"wire":"limit","shape":null},"starting_after":{"wire":"startingAfter","shape":null},"ending_before":{"wire":"endingBefore","shape":null}}}},"saveWebhookGrant":{"id":"saveWebhookGrant","group":"webhooks.grants","method":"save","verb":"PUT","path":"/v1/webhook-grants/{platformId}","ids":["platformId"],"paramsName":"WebhookGrantSaveParams","hasParams":true,"paramsRequired":true,"response":"SaveWebhookGrantResponse","paginated":false,"query":[],"headers":{},"body":true,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{"scopes":{"wire":"scopes","shape":{"items":null}}}}},"revokeWebhookGrant":{"id":"revokeWebhookGrant","group":"webhooks.grants","method":"revoke","verb":"DELETE","path":"/v1/webhook-grants/{platformId}","ids":["platformId"],"paramsName":"WebhookGrantRevokeParams","hasParams":false,"paramsRequired":false,"response":"RevokeWebhookGrantResponse","paginated":false,"query":[],"headers":{},"body":false,"practice":"none","rootOnly":true,"idempotency":"required","shape":{"fields":{}}}}
JSON
  GeneratedClient = Client unless const_defined?(:GeneratedClient)
  remove_const(:Client)
  class AccountSDKResource
    def initialize(context)
      @context = context
    end
    def get(params = {}, options = {})
      result = @context.call('getAccount', [], params, options)
      Types::GetAccountResponse.load(JSON.generate(result))
    end
  end
  class ApiKeysSDKResource
    def initialize(context)
      @context = context
    end
    def create(params, options = {})
      result = @context.call('createPlatformPracticeApiKey', [], params, options)
      Types::CreatePlatformPracticeApiKeyResponse.load(JSON.generate(result))
    end
    def get_access(options = {})
      result = @context.call('getApiAccess', [], {}, options)
      Types::GetApiAccessResponse.load(JSON.generate(result))
    end
  end
  class CatalogSDKResource
    def initialize(context)
      @context = context
    end
    def items = CatalogItemsSDKResource.new(@context)
    def prescribing_options = CatalogPrescribingOptionsSDKResource.new(@context)
    def presentation_prices = CatalogPresentationPricesSDKResource.new(@context)
    def selling_prices = CatalogSellingPricesSDKResource.new(@context)
    def shipping_options = CatalogShippingOptionsSDKResource.new(@context)
  end
  class CatalogItemsSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listCatalogItems', [], params, options)
      Types::ListCatalogItemsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listCatalogItems', [], params, options).lazy.map { |item| Types::ListCatalogItemsResponseDataItem.load(JSON.generate(item)) }
    end
  end
  class CatalogPrescribingOptionsSDKResource
    def initialize(context)
      @context = context
    end
    def get(catalog_item_id, options = {})
      result = @context.call('retrievePrescribingOptions', [catalog_item_id], {}, options)
      Types::RetrievePrescribingOptionsResponse.load(JSON.generate(result))
    end
  end
  class CatalogPresentationPricesSDKResource
    def initialize(context)
      @context = context
    end
    def get(catalog_item_id, options = {})
      result = @context.call('platform.public-api.selling-prices.readPresentationPrice', [catalog_item_id], {}, options)
      Types::PlatformPublicApiSellingPricesReadPresentationPriceResponse.load(JSON.generate(result))
    end
  end
  class CatalogSellingPricesSDKResource
    def initialize(context)
      @context = context
    end
    def get(catalog_item_id, options = {})
      result = @context.call('platform.public-api.selling-prices.readSellingPrice', [catalog_item_id], {}, options)
      Types::PlatformPublicApiSellingPricesReadSellingPriceResponse.load(JSON.generate(result))
    end
  end
  class CatalogShippingOptionsSDKResource
    def initialize(context)
      @context = context
    end
    def list(catalog_item_id, params, options = {})
      result = @context.call('listShippingOptions', [catalog_item_id], params, options)
      result.map { |item| Types::ListShippingOptionsResponseItem.load(JSON.generate(item)) }
    end
  end
  class LocationsSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listPracticeLocations', [], params, options)
      Types::ListPracticeLocationsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPracticeLocations', [], params, options).lazy.map { |item| Types::ListPracticeLocationsResponseDataItem.load(JSON.generate(item)) }
    end
    def create(params, options = {})
      result = @context.call('createPracticeLocation', [], params, options)
      Types::CreatePracticeLocationResponse.load(JSON.generate(result))
    end
    def get(location_id, options = {})
      result = @context.call('getPracticeLocation', [location_id], {}, options)
      Types::GetPracticeLocationResponse.load(JSON.generate(result))
    end
    def update(location_id, params = {}, options = {})
      result = @context.call('updatePracticeLocation', [location_id], params, options)
      Types::UpdatePracticeLocationResponse.load(JSON.generate(result))
    end
    def archive(location_id, options = {})
      result = @context.call('archivePracticeLocation', [location_id], {}, options)
      Types::ArchivePracticeLocationResponse.load(JSON.generate(result))
    end
  end
  class OrdersSDKResource
    def initialize(context)
      @context = context
    end
    def batches = OrdersBatchesSDKResource.new(@context)
    def events = OrdersEventsSDKResource.new(@context)
    def exceptions = OrdersExceptionsSDKResource.new(@context)
    def prescriptions = OrdersPrescriptionsSDKResource.new(@context)
    def test_simulation = OrdersTestSimulationSDKResource.new(@context)
    def list(params = {}, options = {})
      result = @context.call('listOrders', [], params, options)
      Types::ListOrdersResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listOrders', [], params, options).lazy.map { |item| Types::ListOrdersResponseDataItem.load(JSON.generate(item)) }
    end
    def create(params, options = {})
      result = @context.call('createOrder', [], params, options)
      Types::CreateOrderResponse.load(JSON.generate(result))
    end
    def get(order_id, options = {})
      result = @context.call('getOrder', [order_id], {}, options)
      Types::GetOrderResponse.load(JSON.generate(result))
    end
    def cancel(order_id, params, options = {})
      result = @context.call('cancelOrder', [order_id], params, options)
      Types::CancelOrderResponse.load(JSON.generate(result))
    end
    def preview(params, options = {})
      result = @context.call('previewOrder', [], params, options)
      Types::PreviewOrderResponse.load(JSON.generate(result))
    end
    def sign(order_id, params, options = {})
      result = @context.call('signOrder', [order_id], params, options)
      Types::SignOrderResponse.load(JSON.generate(result))
    end
    def sign_and_submit(order_id, params, options = {})
      result = @context.call('signAndSubmitOrder', [order_id], params, options)
      Types::SignAndSubmitOrderResponse.load(JSON.generate(result))
    end
    def submit(order_id, options = {})
      result = @context.call('submitOrder', [order_id], {}, options)
      Types::SubmitOrderResponse.load(JSON.generate(result))
    end
    def reject(order_id, params, options = {})
      result = @context.call('rejectOrder', [order_id], params, options)
      Types::RejectOrderResponse.load(JSON.generate(result))
    end
  end
  class OrdersBatchesSDKResource
    def initialize(context)
      @context = context
    end
    def create(params, options = {})
      result = @context.call('createOrderBatch', [], params, options)
      Types::CreateOrderBatchResponse.load(JSON.generate(result))
    end
  end
  class OrdersEventsSDKResource
    def initialize(context)
      @context = context
    end
    def list(order_id, params = {}, options = {})
      result = @context.call('listOrderEvents', [order_id], params, options)
      Types::ListOrderEventsResponse.load(JSON.generate(result))
    end
    def iterate(order_id, params = {}, options = {})
      @context.iterate('listOrderEvents', [order_id], params, options).lazy.map { |item| Types::ListOrderEventsResponseDataItem.load(JSON.generate(item)) }
    end
  end
  class OrdersExceptionsSDKResource
    def initialize(context)
      @context = context
    end
    def act(order_id, exception_id, params, options = {})
      result = @context.call('actOnOrderException', [order_id, exception_id], params, options)
      Types::ActOnOrderExceptionResponse.load(JSON.generate(result))
    end
  end
  class OrdersPrescriptionsSDKResource
    def initialize(context)
      @context = context
    end
    def add(order_id, params, options = {})
      result = @context.call('addOrderPrescription', [order_id], params, options)
      Types::AddOrderPrescriptionResponse.load(JSON.generate(result))
    end
    def update(order_id, prescription_id, params, options = {})
      result = @context.call('updateOrderPrescription', [order_id, prescription_id], params, options)
      Types::UpdateOrderPrescriptionResponse.load(JSON.generate(result))
    end
  end
  class OrdersTestSimulationSDKResource
    def initialize(context)
      @context = context
    end
    def get(order_id, options = {})
      result = @context.call('getOrderTestSimulation', [order_id], {}, options)
      Types::GetOrderTestSimulationResponse.load(JSON.generate(result))
    end
    def update(order_id, params, options = {})
      result = @context.call('updateOrderTestSimulation', [order_id], params, options)
      Types::UpdateOrderTestSimulationResponse.load(JSON.generate(result))
    end
  end
  class PatientsSDKResource
    def initialize(context)
      @context = context
    end
    def addresses = PatientsAddressesSDKResource.new(@context)
    def allergies = PatientsAllergiesSDKResource.new(@context)
    def list(params = {}, options = {})
      result = @context.call('listPatients', [], params, options)
      Types::ListPatientsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPatients', [], params, options).lazy.map { |item| Types::ListPatientsResponseDataItem.load(JSON.generate(item)) }
    end
    def create(params, options = {})
      result = @context.call('createPatient', [], params, options)
      Types::CreatePatientResponse.load(JSON.generate(result))
    end
    def get(patient_id, options = {})
      result = @context.call('getPatient', [patient_id], {}, options)
      Types::GetPatientResponse.load(JSON.generate(result))
    end
    def delete(patient_id, options = {})
      result = @context.call('deletePatient', [patient_id], {}, options)
      Types::DeletePatientResponse.load(JSON.generate(result))
    end
    def update(patient_id, params = {}, options = {})
      result = @context.call('updatePatient', [patient_id], params, options)
      Types::UpdatePatientResponse.load(JSON.generate(result))
    end
  end
  class PatientsAddressesSDKResource
    def initialize(context)
      @context = context
    end
    def list(patient_id, params = {}, options = {})
      result = @context.call('listPatientAddresses', [patient_id], params, options)
      Types::ListPatientAddressesResponse.load(JSON.generate(result))
    end
    def iterate(patient_id, params = {}, options = {})
      @context.iterate('listPatientAddresses', [patient_id], params, options).lazy.map { |item| Types::ListPatientAddressesResponseDataItem.load(JSON.generate(item)) }
    end
    def create(patient_id, params, options = {})
      result = @context.call('createPatientAddress', [patient_id], params, options)
      Types::CreatePatientAddressResponse.load(JSON.generate(result))
    end
    def update(patient_id, address_id, params = {}, options = {})
      result = @context.call('updatePatientAddress', [patient_id, address_id], params, options)
      Types::UpdatePatientAddressResponse.load(JSON.generate(result))
    end
    def archive(patient_id, address_id, options = {})
      result = @context.call('archivePatientAddress', [patient_id, address_id], {}, options)
      Types::ArchivePatientAddressResponse.load(JSON.generate(result))
    end
    def set_default(patient_id, address_id, options = {})
      result = @context.call('setDefaultPatientAddress', [patient_id, address_id], {}, options)
      Types::SetDefaultPatientAddressResponse.load(JSON.generate(result))
    end
  end
  class PatientsAllergiesSDKResource
    def initialize(context)
      @context = context
    end
    def get(patient_id, options = {})
      result = @context.call('getPatientAllergies', [patient_id], {}, options)
      Types::GetPatientAllergiesResponse.load(JSON.generate(result))
    end
    def replace(patient_id, params, options = {})
      result = @context.call('replacePatientAllergies', [patient_id], params, options)
      Types::ReplacePatientAllergiesResponse.load(JSON.generate(result))
    end
  end
  class PharmaciesSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listPharmacies', [], params, options)
      Types::ListPharmaciesResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPharmacies', [], params, options).lazy.map { |item| Types::ListPharmaciesResponseDataItem.load(JSON.generate(item)) }
    end
  end
  class PracticesSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listPractices', [], params, options)
      Types::ListPracticesResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPractices', [], params, options).lazy.map { |item| Types::ListPracticesResponseDataItem.load(JSON.generate(item)) }
    end
    def create(params, options = {})
      result = @context.call('createPractice', [], params, options)
      Types::CreatePracticeResponse.load(JSON.generate(result))
    end
    def get(practice_id, options = {})
      result = @context.call('getPractice', [practice_id], {}, options)
      Types::GetPracticeResponse.load(JSON.generate(result))
    end
    def update(practice_id, params = {}, options = {})
      result = @context.call('updatePractice', [practice_id], params, options)
      Types::UpdatePracticeResponse.load(JSON.generate(result))
    end
  end
  class TeamSDKResource
    def initialize(context)
      @context = context
    end
    def invitations = TeamInvitationsSDKResource.new(@context)
    def members = TeamMembersSDKResource.new(@context)
    def prescribers = TeamPrescribersSDKResource.new(@context)
    def register(params, options = {})
      result = @context.call('registerUser', [], params, options)
      Types::RegisterUserResponse.load(JSON.generate(result))
    end
    def get(options = {})
      result = @context.call('getPracticeTeam', [], {}, options)
      Types::GetPracticeTeamResponse.load(JSON.generate(result))
    end
  end
  class TeamInvitationsSDKResource
    def initialize(context)
      @context = context
    end
    def create(params, options = {})
      result = @context.call('invitePracticeTeamPerson', [], params, options)
      Types::InvitePracticeTeamPersonResponse.load(JSON.generate(result))
    end
    def list(params = {}, options = {})
      result = @context.call('listPracticeTeamInvitations', [], params, options)
      Types::ListPracticeTeamInvitationsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPracticeTeamInvitations', [], params, options).lazy.map { |item| Types::ListPracticeTeamInvitationsResponseDataItem.load(JSON.generate(item)) }
    end
    def get(invitation_id, options = {})
      result = @context.call('getPracticeTeamInvitation', [invitation_id], {}, options)
      Types::GetPracticeTeamInvitationResponse.load(JSON.generate(result))
    end
    def revoke(invitation_id, options = {})
      result = @context.call('revokePracticeTeamInvitation', [invitation_id], {}, options)
      Types::RevokePracticeTeamInvitationResponse.load(JSON.generate(result))
    end
    def resend(invitation_id, options = {})
      result = @context.call('resendPracticeTeamInvitation', [invitation_id], {}, options)
      Types::ResendPracticeTeamInvitationResponse.load(JSON.generate(result))
    end
  end
  class TeamMembersSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listPracticeTeamMembers', [], params, options)
      Types::ListPracticeTeamMembersResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPracticeTeamMembers', [], params, options).lazy.map { |item| Types::ListPracticeTeamMembersResponseDataItem.load(JSON.generate(item)) }
    end
    def get(member_id, options = {})
      result = @context.call('getPracticeTeamMember', [member_id], {}, options)
      Types::GetPracticeTeamMemberResponse.load(JSON.generate(result))
    end
    def update(member_id, params = {}, options = {})
      result = @context.call('updatePracticeTeamMember', [member_id], params, options)
      Types::UpdatePracticeTeamMemberResponse.load(JSON.generate(result))
    end
  end
  class TeamPrescribersSDKResource
    def initialize(context)
      @context = context
    end
    def licenses = TeamPrescribersLicensesSDKResource.new(@context)
    def list(params = {}, options = {})
      result = @context.call('listPracticeTeamPrescribers', [], params, options)
      Types::ListPracticeTeamPrescribersResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listPracticeTeamPrescribers', [], params, options).lazy.map { |item| Types::ListPracticeTeamPrescribersResponseDataItem.load(JSON.generate(item)) }
    end
    def get(prescriber_id, options = {})
      result = @context.call('getPracticeTeamPrescriber', [prescriber_id], {}, options)
      Types::GetPracticeTeamPrescriberResponse.load(JSON.generate(result))
    end
    def update(prescriber_id, params = {}, options = {})
      result = @context.call('updatePracticeTeamPrescriber', [prescriber_id], params, options)
      Types::UpdatePracticeTeamPrescriberResponse.load(JSON.generate(result))
    end
  end
  class TeamPrescribersLicensesSDKResource
    def initialize(context)
      @context = context
    end
    def create(prescriber_id, params, options = {})
      result = @context.call('createPracticeTeamLicense', [prescriber_id], params, options)
      Types::CreatePracticeTeamLicenseResponse.load(JSON.generate(result))
    end
    def update(prescriber_id, license_id, params = {}, options = {})
      result = @context.call('updatePracticeTeamLicense', [prescriber_id, license_id], params, options)
      Types::UpdatePracticeTeamLicenseResponse.load(JSON.generate(result))
    end
  end
  class WebhooksSDKResource
    def initialize(context)
      @context = context
    end
    def endpoints = WebhooksEndpointsSDKResource.new(@context)
    def events = WebhooksEventsSDKResource.new(@context)
    def grants = WebhooksGrantsSDKResource.new(@context)
  end
  class WebhooksEndpointsSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listWebhookEndpoints', [], params, options)
      Types::ListWebhookEndpointsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listWebhookEndpoints', [], params, options).lazy.map { |item| Types::ListWebhookEndpointsResponseDataItem.load(JSON.generate(item)) }
    end
    def create(params, options = {})
      result = @context.call('createWebhookEndpoint', [], params, options)
      Types::CreateWebhookEndpointResponse.load(JSON.generate(result))
    end
    def update(endpoint_id, params = {}, options = {})
      result = @context.call('updateWebhookEndpoint', [endpoint_id], params, options)
      Types::UpdateWebhookEndpointResponse.load(JSON.generate(result))
    end
    def delete(endpoint_id, options = {})
      result = @context.call('deleteWebhookEndpoint', [endpoint_id], {}, options)
      Types::DeleteWebhookEndpointResponse.load(JSON.generate(result))
    end
    def rotate_secret(endpoint_id, options = {})
      result = @context.call('rotateWebhookEndpointSecret', [endpoint_id], {}, options)
      Types::RotateWebhookEndpointSecretResponse.load(JSON.generate(result))
    end
    def test(endpoint_id, options = {})
      result = @context.call('testWebhookEndpoint', [endpoint_id], {}, options)
      Types::TestWebhookEndpointResponse.load(JSON.generate(result))
    end
  end
  class WebhooksEventsSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listWebhookEvents', [], params, options)
      Types::ListWebhookEventsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listWebhookEvents', [], params, options).lazy.map { |item| Types::ListWebhookEventsResponseDataItem.load(JSON.generate(item)) }
    end
    def get(event_id, options = {})
      result = @context.call('getWebhookEvent', [event_id], {}, options)
      Types::GetWebhookEventResponse.load(JSON.generate(result))
    end
    def replay(event_id, options = {})
      result = @context.call('replayWebhookEvent', [event_id], {}, options)
      Types::ReplayWebhookEventResponse.load(JSON.generate(result))
    end
  end
  class WebhooksGrantsSDKResource
    def initialize(context)
      @context = context
    end
    def list(params = {}, options = {})
      result = @context.call('listWebhookGrants', [], params, options)
      Types::ListWebhookGrantsResponse.load(JSON.generate(result))
    end
    def iterate(params = {}, options = {})
      @context.iterate('listWebhookGrants', [], params, options).lazy.map { |item| Types::ListWebhookGrantsResponseDataItem.load(JSON.generate(item)) }
    end
    def save(platform_id, params, options = {})
      result = @context.call('saveWebhookGrant', [platform_id], params, options)
      Types::SaveWebhookGrantResponse.load(JSON.generate(result))
    end
    def revoke(platform_id, options = {})
      result = @context.call('revokeWebhookGrant', [platform_id], {}, options)
      Types::RevokeWebhookGrantResponse.load(JSON.generate(result))
    end
  end
  class Client
    def initialize(api_key, **configuration)
      @context = SDKContext.new(SDKTransport.new(api_key, **configuration))
    end
    def for_practice(practice_id)
      raise ArgumentError, 'practice_id is required' if practice_id.to_s.strip.empty?
      raise ArgumentError, 'Conflicting practice ID' if @context.practice_id && @context.practice_id != practice_id
      client = self.class.allocate
      client.instance_variable_set(:@context, SDKContext.new(@context.transport, practice_id))
      client
    end
    def account = AccountSDKResource.new(@context)
    def api_keys = ApiKeysSDKResource.new(@context)
    def catalog = CatalogSDKResource.new(@context)
    def locations = LocationsSDKResource.new(@context)
    def orders = OrdersSDKResource.new(@context)
    def patients = PatientsSDKResource.new(@context)
    def pharmacies = PharmaciesSDKResource.new(@context)
    def practices = PracticesSDKResource.new(@context)
    def team = TeamSDKResource.new(@context)
    def webhooks = WebhooksSDKResource.new(@context)
  end
end
