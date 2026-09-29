# frozen_string_literal: true

module Affinity
  module Webhooks
    module Grants
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Requires webhooks:read on the owning practice or pharmacy key. Lists platform webhook grants in the key's
        # mode. Platforms cannot list or grant themselves delegated access.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :starting_after
        # @option params [String, nil] :ending_before
        #
        # @return [Affinity::Types::ListWebhookGrantsResponse]
        def list(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
          query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/webhook-grants",
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
            Affinity::Types::ListWebhookGrantsResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requires webhooks:write on the owning practice or pharmacy key and Idempotency-Key. Grants or replaces a
        # platform's webhook permissions in this mode. A practice must already be connected to that platform. The grant
        # does not give the platform access to other API resources.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Webhooks::Grants::Types::SaveWebhookGrantRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :platform_id
        # @option params [String] :idempotency_key
        #
        # @return [Affinity::Types::SaveWebhookGrantResponse]
        def save(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Webhooks::Grants::Types::SaveWebhookGrantRequest.new(params).to_h
          non_body_param_names = %w[platformId Idempotency-Key]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v1/webhook-grants/#{URI.encode_uri_component(params[:platform_id].to_s)}",
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
            Affinity::Types::SaveWebhookGrantResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requires webhooks:write on the owning practice or pharmacy key and Idempotency-Key. Removes platform webhook
        # access in this mode. Existing endpoints remain owned by the practice or pharmacy and continue operating.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :platform_id
        # @option params [String] :idempotency_key
        #
        # @return [Affinity::Types::RevokeWebhookGrantResponse]
        def revoke(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v1/webhook-grants/#{URI.encode_uri_component(params[:platform_id].to_s)}",
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
            Affinity::Types::RevokeWebhookGrantResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
