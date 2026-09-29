require "securerandom"
# frozen_string_literal: true

module Affinity
  module Locations
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Requires locations:read on a practice key or an authorized platform key. Lists active and archived locations by
      # name, with cursor pagination. Use status to filter. Location records are shared between Test and Live for the
      # same practice.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :starting_after
      # @option params [String, nil] :ending_before
      # @option params [Affinity::Locations::Types::ListLocationsRequestStatus, nil] :status
      #
      # @return [Affinity::Types::ListPracticeLocationsResponse]
      def list(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["status"] = params[:status] if params.key?(:status)

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/locations",
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
          Affinity::Types::ListPracticeLocationsResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires locations:write and Idempotency-Key for API keys. Creates an active location with a unique name in this
      # practice. Locations are shared between Test and Live. Use the returned ID for Team location access.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Locations::Types::CreatePracticeLocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String, nil] :idempotency_key
      #
      # @return [Affinity::Types::CreatePracticeLocationResponse]
      def create(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Locations::Types::CreatePracticeLocationRequest.new(params).to_h
        non_body_param_names = %w[practiceId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/locations",
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
          Affinity::Types::CreatePracticeLocationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires locations:read. Returns one active or archived location in the authorized practice.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :location_id
      #
      # @return [Affinity::Types::GetPracticeLocationResponse]
      def get(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/locations/#{URI.encode_uri_component(params[:location_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::GetPracticeLocationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires locations:write and Idempotency-Key for API keys. Updates only supplied fields; null clears optional
      # contact and address fields. Archived locations cannot be updated. Changes apply to both Test and Live.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Locations::Types::UpdatePracticeLocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :location_id
      # @option params [String, nil] :idempotency_key
      #
      # @return [Affinity::Types::UpdatePracticeLocationResponse]
      def update(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Locations::Types::UpdatePracticeLocationRequest.new(params).to_h
        non_body_param_names = %w[practiceId locationId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/locations/#{URI.encode_uri_component(params[:location_id].to_s)}",
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
          Affinity::Types::UpdatePracticeLocationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires locations:write and Idempotency-Key for API keys. Retains the location and historical associations.
      # Archived locations cannot receive new Team assignments. Repeating archive returns the archived location. Changes
      # apply to both Test and Live.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :location_id
      # @option params [String, nil] :idempotency_key
      #
      # @return [Affinity::Types::ArchivePracticeLocationResponse]
      def archive(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/locations/#{URI.encode_uri_component(params[:location_id].to_s)}/archive",
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
          Affinity::Types::ArchivePracticeLocationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
