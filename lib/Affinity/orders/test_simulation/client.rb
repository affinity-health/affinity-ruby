# frozen_string_literal: true

module Affinity
  module Orders
    module TestSimulation
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
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
        def get(request_options: {}, **params)
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

        # Requires orders:write and Idempotency-Key. Configure before submission or queue a valid pharmacy event in
        # manual mode. Events use normal order history and Test webhooks. Live requests are rejected.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Orders::TestSimulation::Types::UpdateOrderTestSimulationRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :order_id
        # @option params [String] :idempotency_key
        #
        # @return [Affinity::Types::UpdateOrderTestSimulationResponse]
        def update(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Orders::TestSimulation::Types::UpdateOrderTestSimulationRequest.new(params).to_h
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
      end
    end
  end
end
