# frozen_string_literal: true

module Affinity
  module Orders
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :query
      # @option params [String, nil] :external_order_id
      # @option params [String, nil] :created_after
      # @option params [String, nil] :created_before
      # @option params [String, nil] :ending_before
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :order_id
      # @option params [String, nil] :patient_id
      # @option params [String, nil] :patient_external_id
      # @option params [String, nil] :practice_id
      # @option params [Affinity::Orders::Types::ListOrdersRequestSort, nil] :sort
      # @option params [String, nil] :starting_after
      # @option params [Affinity::Orders::Types::ListOrdersRequestStatus, nil] :status
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::ListOrdersResponse]
      def list_orders(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["query"] = params[:query] if params.key?(:query)
        query_params["externalOrderId"] = params[:external_order_id] if params.key?(:external_order_id)
        query_params["createdAfter"] = params[:created_after] if params.key?(:created_after)
        query_params["createdBefore"] = params[:created_before] if params.key?(:created_before)
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["orderId"] = params[:order_id] if params.key?(:order_id)
        query_params["patientId"] = params[:patient_id] if params.key?(:patient_id)
        query_params["patientExternalId"] = params[:patient_external_id] if params.key?(:patient_external_id)
        query_params["practiceId"] = params[:practice_id] if params.key?(:practice_id)
        query_params["sort"] = params[:sort] if params.key?(:sort)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
        query_params["status"] = params[:status] if params.key?(:status)

        headers = {}
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/orders",
          headers: headers,
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::ListOrdersResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates one unsigned order with 1–20 prescriptions for one patient in one practice. Supply patientId or patient;
      # inline patient creation requires patients:write. Prescriber is optional: select by npi, provider id, or
      # integration-scoped externalId, or leave the draft unassigned until signing. First-use prescriber registration
      # requires team:write. Legacy userId is supported but cannot be combined with prescriber. Idempotency-Key is
      # required.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::CreateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::CreateOrderResponse]
      def create_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::CreateOrderRequest.new(params).to_h
        non_body_param_names = %w[Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::CreateOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::GetOrderResponse]
      def get_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}",
          headers: headers,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::GetOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requests cancellation. HTTP 200 means the request was handled; check cancellation.status for confirmed, pending,
      # partial, or failed. Only confirmed means the entire order is cancelled. Shipment possession makes a fulfillment
      # cancellation too late.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::CancelOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::CancelOrderResponse]
      def cancel_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::CancelOrderRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/cancel",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::CancelOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Acknowledge, retry, contact, or resolve an order exception in the credential's Test/Live mode. assign_to_me
      # requires a signed-in dashboard user; API keys receive 400 and may use acknowledge instead. Actor headers do not
      # create a dashboard assignee.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::ActOnOrderExceptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :exception_id
      # @option params [String] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::ActOnOrderExceptionResponse]
      def act_on_order_exception(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::ActOnOrderExceptionRequest.new(params).to_h
        non_body_param_names = %w[orderId exceptionId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/exceptions/#{URI.encode_uri_component(params[:exception_id].to_s)}/actions",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::ActOnOrderExceptionResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String, nil] :ending_before
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :starting_after
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::ListOrderEventsResponse]
      def list_order_events(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)

        headers = {}
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/events",
          headers: headers,
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::ListOrderEventsResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:write. Available only in Test mode.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @return [Affinity::Types::GetOrderTestSimulationResponse]
      def get_order_test_simulation(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/test-simulation",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::GetOrderTestSimulationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:write and Idempotency-Key. Configure before submission or queue a valid pharmacy event in manual
      # mode. Events use normal order history and Test webhooks. Live requests are rejected.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::UpdateOrderTestSimulationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::UpdateOrderTestSimulationResponse]
      def update_order_test_simulation(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::UpdateOrderTestSimulationRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/test-simulation",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::UpdateOrderTestSimulationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:write and catalog:read. Supply exactly one of patientId, patientExternalId, or inline patient
      # details. External-ID lookup additionally requires patients:read; inline details require patients:write. Resolves
      # defaults and explicit edits for 1–20 prescriptions. Reuses stored patient details when identifiers match;
      # otherwise previews inline details without creating a patient. Complete previews contain an orders.create input.
      # Does not create records, reserve prices, sign, charge or transmit. No idempotency key is required. Creation and
      # signing recheck current requirements.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::PreviewOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Affinity::Types::PreviewOrderResponse]
      def preview_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/order-previews",
          body: Affinity::Orders::Types::PreviewOrderRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::PreviewOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:sign, Idempotency-Key, signatureAttestation, and expectedRevision from the reviewed order.
      # Existing integrations may send expectedVersions instead; supply exactly one. A stale revision returns 409 and
      # requires renewed clinician review. Select prescriber by npi, provider id, or integration-scoped externalId, or
      # inherit the draft's prescriber. First-use registration requires team:write. Actor headers are optional audit
      # metadata with prescriber; legacy userId requires matching clinician actor headers. Signing does not submit to a
      # pharmacy.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::SignOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::SignOrderResponse]
      def sign_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::SignOrderRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/sign",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::SignOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:sign, Idempotency-Key, signatureAttestation, and expectedRevision from the reviewed order.
      # Existing integrations may send expectedVersions instead; supply exactly one. A stale revision returns 409 and
      # requires renewed clinician review. Select prescriber by npi, provider id, or externalId, or inherit the draft's
      # prescriber. First-use registration requires team:write. Actor headers are optional with prescriber; legacy
      # userId requires matching clinician actor headers. Signs the complete order, then attempts each submission.
      # Signing remains committed if submission fails. Replay the same key after an uncertain response; retry reported
      # submission failures through Submit order with a new key. Submitted means queued, not pharmacy acceptance.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::SignAndSubmitOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::SignAndSubmitOrderResponse]
      def sign_and_submit_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::SignAndSubmitOrderRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/sign-and-submit",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::SignAndSubmitOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:sign and Idempotency-Key. Queues signed prescriptions after rechecking authorization, signature
      # integrity, billing, and fulfillment eligibility. Track pharmacy acceptance through order reads and webhooks.
      # After a partial failure, retry submission with a new idempotency key; already queued prescriptions are not
      # duplicated.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::SubmitOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::SubmitOrderResponse]
      def submit_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::SubmitOrderRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/submit",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::SubmitOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:sign and Idempotency-Key. Select a prescriber or inherit the draft's prescriber. Legacy userId
      # requires matching clinician actor headers. Supply expectedRevision from the reviewed order, or expectedVersions
      # for existing integrations. Permanently rejects the complete unsigned order after checking its revision.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::RejectOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::RejectOrderResponse]
      def reject_order(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::RejectOrderRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/rejection",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::RejectOrderResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:write, Idempotency-Key and expectedRevision from the order being edited. Existing integrations
      # may send expectedVersions instead; supply exactly one. Adds a complete prescription to an unsigned Order and
      # returns all new versions. Omitted actor context defaults to the authenticated service account as a system actor.
      # Patient and prescriber attribution stay fixed. Signed orders cannot be amended through this endpoint. Signing
      # and submission require orders:sign through their separate endpoints.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::AddOrderPrescriptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::AddOrderPrescriptionResponse]
      def add_order_prescription(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::AddOrderPrescriptionRequest.new(params).to_h
        non_body_param_names = %w[orderId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/prescriptions",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::AddOrderPrescriptionResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires orders:write, Idempotency-Key and expectedRevision from the order being edited. Existing integrations
      # may send expectedVersions instead; supply exactly one. Replaces one prescription with complete medication
      # instructions and returns all new versions. Omitted actor context defaults to the authenticated service account
      # as a system actor. Patient and prescriber attribution stay fixed. Signed orders cannot be amended through this
      # endpoint. Signing and submission require orders:sign through their separate endpoints.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::UpdateOrderPrescriptionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      # @option params [String] :prescription_id
      # @option params [String] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::UpdateOrderPrescriptionResponse]
      def update_order_prescription(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::UpdateOrderPrescriptionRequest.new(params).to_h
        non_body_param_names = %w[orderId prescriptionId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/prescriptions/#{URI.encode_uri_component(params[:prescription_id].to_s)}",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::UpdateOrderPrescriptionResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates 1–20 orders for distinct patients in one practice, each with 1–20 prescriptions. Each accepts patientId
      # or inline patient details. Orders and newly created patients commit atomically; any failure saves none. Requires
      # orders:write and Idempotency-Key; inline patients also require patients:write. Omitted actor context defaults to
      # the authenticated service account as a system actor. Sign and submit each resulting order separately using
      # orders:sign.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Orders::Types::CreateOrderBatchRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::CreateOrderBatchResponse]
      def create_order_batch(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Orders::Types::CreateOrderBatchRequest.new(params).to_h
        non_body_param_names = %w[Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/order-batches",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::CreateOrderBatchResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
