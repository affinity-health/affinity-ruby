# frozen_string_literal: true

module Affinity
  module Orders
    module Exceptions
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Acknowledge, retry, contact, or resolve an order exception in the credential's Test/Live mode. assign_to_me
        # requires a signed-in dashboard user; API keys receive 400 and may use acknowledge instead. Actor headers do
        # not create a dashboard assignee.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Orders::Exceptions::Types::ActOnOrderExceptionRequest]
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
        def act(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Orders::Exceptions::Types::ActOnOrderExceptionRequest.new(params).to_h
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
      end
    end
  end
end
