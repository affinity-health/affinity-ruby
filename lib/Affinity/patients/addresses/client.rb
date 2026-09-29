require "securerandom"
# frozen_string_literal: true

module Affinity
  module Patients
    module Addresses
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
        # @option params [String] :practice_id
        # @option params [String] :patient_id
        # @option params [Affinity::Patients::Addresses::Types::ListAddressesRequestStatus, nil] :status
        # @option params [String, nil] :starting_after
        # @option params [String, nil] :ending_before
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :affinity_actor_id
        # @option params [String, nil] :affinity_actor_type
        #
        # @return [Affinity::Types::ListPatientAddressesResponse]
        def list(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
          query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
          query_params["limit"] = params[:limit] if params.key?(:limit)

          headers = {}
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/addresses",
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
            Affinity::Types::ListPatientAddressesResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the existing active address for a normalized duplicate. The first address becomes the default. API
        # keys require Idempotency-Key.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Patients::Addresses::Types::CreatePatientAddressRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :patient_id
        # @option params [String, nil] :idempotency_key
        # @option params [String, nil] :affinity_actor_id
        # @option params [String, nil] :affinity_actor_type
        #
        # @return [Affinity::Types::CreatePatientAddressResponse]
        def create(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Patients::Addresses::Types::CreatePatientAddressRequest.new(params).to_h
          non_body_param_names = %w[practiceId patientId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/addresses",
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
            Affinity::Types::CreatePatientAddressResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Preserves the address ID and history. Archiving the default selects the oldest remaining active address.
        # Existing orders remain unchanged.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :patient_id
        # @option params [String] :address_id
        # @option params [String, nil] :idempotency_key
        # @option params [String, nil] :affinity_actor_id
        # @option params [String, nil] :affinity_actor_type
        #
        # @return [Affinity::Types::ArchivePatientAddressResponse]
        def archive(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/addresses/#{URI.encode_uri_component(params[:address_id].to_s)}",
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
            Affinity::Types::ArchivePatientAddressResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Affinity::Patients::Addresses::Types::UpdatePatientAddressRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :patient_id
        # @option params [String] :address_id
        # @option params [String, nil] :idempotency_key
        # @option params [String, nil] :affinity_actor_id
        # @option params [String, nil] :affinity_actor_type
        #
        # @return [Affinity::Types::UpdatePatientAddressResponse]
        def update(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Patients::Addresses::Types::UpdatePatientAddressRequest.new(params).to_h
          non_body_param_names = %w[practiceId patientId addressId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/addresses/#{URI.encode_uri_component(params[:address_id].to_s)}",
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
            Affinity::Types::UpdatePatientAddressResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Changes delivery selection for future drafts, without changing patient clinical location or existing signed
        # orders.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :patient_id
        # @option params [String] :address_id
        # @option params [String, nil] :idempotency_key
        # @option params [String, nil] :affinity_actor_id
        # @option params [String, nil] :affinity_actor_type
        #
        # @return [Affinity::Types::SetDefaultPatientAddressResponse]
        def set_default(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/addresses/#{URI.encode_uri_component(params[:address_id].to_s)}/default",
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
            Affinity::Types::SetDefaultPatientAddressResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
