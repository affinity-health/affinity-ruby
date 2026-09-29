# frozen_string_literal: true

module Affinity
  module Webhooks
    module Events
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
        # @option params [String, nil] :ending_before
        # @option params [Integer, nil] :limit
        # @option params [Affinity::Webhooks::Events::Types::ListEventsRequestStatus, nil] :status
        # @option params [String, nil] :starting_after
        # @option params [String, nil] :affinity_organization_id
        #
        # @return [Affinity::Types::ListWebhookEventsResponse]
        def list(request_options: {}, **params)
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
        def get(request_options: {}, **params)
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
        def replay(request_options: {}, **params)
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
      end
    end
  end
end
