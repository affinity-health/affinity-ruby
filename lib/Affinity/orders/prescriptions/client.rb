# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Requires orders:write, Idempotency-Key and expectedRevision from the order being edited. Existing integrations
        # may send expectedVersions instead; supply exactly one. Adds a complete prescription to an unsigned Order and
        # returns all new versions. Omitted actor context defaults to the authenticated service account as a system
        # actor. Patient and prescriber attribution stay fixed. Signed orders cannot be amended through this endpoint.
        # Signing and submission require orders:sign through their separate endpoints.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequest]
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
        def add(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequest.new(params).to_h
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
        # @param params [Affinity::Orders::Prescriptions::Types::UpdateOrderPrescriptionRequest]
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
        def update(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Orders::Prescriptions::Types::UpdateOrderPrescriptionRequest.new(params).to_h
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
      end
    end
  end
end
