require "securerandom"
# frozen_string_literal: true

module Affinity
  module Practices
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the practices that belong to the platform. The default Affinity-Version is 2026-09-28.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :search
      # @option params [String, nil] :ending_before
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :starting_after
      #
      # @return [Affinity::Types::ListPracticesResponse]
      def list(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["search"] = params[:search] if params.key?(:search)
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices",
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
          Affinity::Types::ListPracticesResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a practice owned by the platform. Set liveEnabled to true to enable Live access at creation with an
      # approved platform and a Live request. Defaults to false. Requires practices:write. Send Idempotency-Key when you
      # retry the same request.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Practices::Types::CreatePracticeRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :idempotency_key
      #
      # @return [Affinity::Types::CreatePracticeResponse]
      def create(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Practices::Types::CreatePracticeRequest.new(params).to_h
        non_body_param_names = %w[Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices",
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
          Affinity::Types::CreatePracticeResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns one practice that belongs to the platform.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      #
      # @return [Affinity::Types::GetPracticeResponse]
      def get(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::GetPracticeResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates one practice owned by the platform. Set liveEnabled to true or false to control Live access with an
      # approved platform and a Live request. Affinity Admin decisions take precedence. Requires practices:write. Send
      # Idempotency-Key when you retry the same request.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Practices::Types::UpdatePracticeRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String, nil] :idempotency_key
      #
      # @return [Affinity::Types::UpdatePracticeResponse]
      def update(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Practices::Types::UpdatePracticeRequest.new(params).to_h
        non_body_param_names = %w[practiceId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}",
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
          Affinity::Types::UpdatePracticeResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
