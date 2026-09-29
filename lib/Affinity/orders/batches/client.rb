# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Creates 1–20 orders for distinct patients in one practice, each with 1–20 prescriptions. Each accepts
        # patientId or inline patient details. Orders and newly created patients commit atomically; any failure saves
        # none. Requires orders:write and Idempotency-Key; inline patients also require patients:write. Omitted actor
        # context defaults to the authenticated service account as a system actor. Sign and submit each resulting order
        # separately using orders:sign.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Orders::Batches::Types::CreateOrderBatchRequest]
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
        def create(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Orders::Batches::Types::CreateOrderBatchRequest.new(params).to_h
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
end
