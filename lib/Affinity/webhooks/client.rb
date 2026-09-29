# frozen_string_literal: true

module Affinity
  module Webhooks
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Requires webhooks:read. Returns endpoints owned by the key organization, or the organization selected with
      # X-Affinity-Organization-Id. Platform delegation requires a webhook grant in the key's mode.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :ending_before
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :starting_after
      # @option params [String, nil] :affinity_organization_id
      #
      # @return [Affinity::Types::ListWebhookEndpointsResponse]
      def list_webhook_endpoints(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)

        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/webhook-endpoints",
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
          Affinity::Types::ListWebhookEndpointsResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires webhooks:write and Idempotency-Key. Defaults to the API key organization. A platform can select a
      # practice or pharmacy owner with X-Affinity-Organization-Id and an explicit webhook grant. For platform-owned
      # endpoints, practiceIds narrows delivery to selected connected practices. An empty filter receives all
      # otherwise-authorized events.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Webhooks::Types::CreateWebhookEndpointRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :affinity_organization_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::CreateWebhookEndpointResponse]
      def create_webhook_endpoint(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Webhooks::Types::CreateWebhookEndpointRequest.new(params).to_h
        non_body_param_names = %w[X-Affinity-Organization-Id Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/webhook-endpoints",
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
          Affinity::Types::CreateWebhookEndpointResponse.load(response.body)
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
      # @option params [String] :endpoint_id
      # @option params [String, nil] :affinity_organization_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::DeleteWebhookEndpointResponse]
      def delete_webhook_endpoint(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v1/webhook-endpoints/#{URI.encode_uri_component(params[:endpoint_id].to_s)}",
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
          Affinity::Types::DeleteWebhookEndpointResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires webhooks:write and Idempotency-Key. Updates an endpoint in the selected organization and mode. Omitted
      # practiceIds preserves the filter; an empty array removes the practice filter. Subscription changes apply to
      # newly generated events.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Webhooks::Types::UpdateWebhookEndpointRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :endpoint_id
      # @option params [String, nil] :affinity_organization_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::UpdateWebhookEndpointResponse]
      def update_webhook_endpoint(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Webhooks::Types::UpdateWebhookEndpointRequest.new(params).to_h
        non_body_param_names = %w[endpointId X-Affinity-Organization-Id Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/webhook-endpoints/#{URI.encode_uri_component(params[:endpoint_id].to_s)}",
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
          Affinity::Types::UpdateWebhookEndpointResponse.load(response.body)
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
      # @option params [String] :endpoint_id
      # @option params [String, nil] :affinity_organization_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::RotateWebhookEndpointSecretResponse]
      def rotate_webhook_endpoint_secret(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/webhook-endpoints/#{URI.encode_uri_component(params[:endpoint_id].to_s)}/rotate-secret",
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
          Affinity::Types::RotateWebhookEndpointSecretResponse.load(response.body)
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
      # @option params [String] :endpoint_id
      # @option params [String, nil] :affinity_organization_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::TestWebhookEndpointResponse]
      def test_webhook_endpoint(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/webhook-endpoints/#{URI.encode_uri_component(params[:endpoint_id].to_s)}/test",
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
          Affinity::Types::TestWebhookEndpointResponse.load(response.body)
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
      # @option params [String, nil] :ending_before
      # @option params [Integer, nil] :limit
      # @option params [Affinity::Webhooks::Types::ListWebhookEventsRequestStatus, nil] :status
      # @option params [String, nil] :starting_after
      # @option params [String, nil] :affinity_organization_id
      #
      # @return [Affinity::Types::ListWebhookEventsResponse]
      def list_webhook_events(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)

        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/webhook-events",
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
          Affinity::Types::ListWebhookEventsResponse.load(response.body)
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
      # @option params [String] :event_id
      # @option params [String, nil] :affinity_organization_id
      #
      # @return [Affinity::Types::GetWebhookEventResponse]
      def get_webhook_event(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/webhook-events/#{URI.encode_uri_component(params[:event_id].to_s)}",
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
          Affinity::Types::GetWebhookEventResponse.load(response.body)
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
      # @option params [String] :event_id
      # @option params [String, nil] :affinity_organization_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::ReplayWebhookEventResponse]
      def replay_webhook_event(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["X-Affinity-Organization-Id"] = params[:affinity_organization_id] if params[:affinity_organization_id]
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/webhook-events/#{URI.encode_uri_component(params[:event_id].to_s)}/replay",
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
          Affinity::Types::ReplayWebhookEventResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires webhooks:read on the owning practice or pharmacy key. Lists platform webhook grants in the key's mode.
      # Platforms cannot list or grant themselves delegated access.
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
      def list_webhook_grants(request_options: {}, **params)
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
      # @param params [Affinity::Webhooks::Types::SaveWebhookGrantRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :platform_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::SaveWebhookGrantResponse]
      def save_webhook_grant(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Webhooks::Types::SaveWebhookGrantRequest.new(params).to_h
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
      def revoke_webhook_grant(request_options: {}, **params)
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
