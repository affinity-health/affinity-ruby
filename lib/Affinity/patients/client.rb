require "securerandom"
# frozen_string_literal: true

module Affinity
  module Patients
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Lists patients in one practice and mode. Use externalId for an exact match in the calling integration's
      # namespace. Use externalIdentitySource with externalIdentityValue to search an explicit alias. Identity matching
      # is case-sensitive after trimming whitespace. Other filters also apply.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String, nil] :ending_before
      # @option params [String, nil] :external_id
      # @option params [String, nil] :external_identity_source
      # @option params [String, nil] :external_identity_value
      # @option params [Affinity::Patients::Types::ListPatientsRequestGender, nil] :gender
      # @option params [String, nil] :last_order_after
      # @option params [String, nil] :last_order_before
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :program
      # @option params [String, nil] :query
      # @option params [Affinity::Patients::Types::ListPatientsRequestSort, nil] :sort
      # @option params [String, nil] :starting_after
      # @option params [String, nil] :states
      # @option params [Affinity::Patients::Types::ListPatientsRequestStatus, nil] :status
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::ListPatientsResponse]
      def list(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["externalId"] = params[:external_id] if params.key?(:external_id)
        query_params["externalIdentitySource"] = params[:external_identity_source] if params.key?(:external_identity_source)
        query_params["externalIdentityValue"] = params[:external_identity_value] if params.key?(:external_identity_value)
        query_params["gender"] = params[:gender] if params.key?(:gender)
        query_params["lastOrderAfter"] = params[:last_order_after] if params.key?(:last_order_after)
        query_params["lastOrderBefore"] = params[:last_order_before] if params.key?(:last_order_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["program"] = params[:program] if params.key?(:program)
        query_params["query"] = params[:query] if params.key?(:query)
        query_params["sort"] = params[:sort] if params.key?(:sort)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
        query_params["states"] = params[:states] if params.key?(:states)
        query_params["status"] = params[:status] if params.key?(:status)

        headers = {}
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients",
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
          Affinity::Types::ListPatientsResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a patient or resolves a matching externalId or external identity within this practice and mode.
      # externalId belongs to the calling integration; externalIdentities holds aliases from other systems. Resolution
      # preserves existing demographics; use PATCH to update them. Conflicting identifiers return 409. Email never
      # merges patients. API keys require Idempotency-Key.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Patients::Types::CreatePatientRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String, nil] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::CreatePatientResponse]
      def create(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Patients::Types::CreatePatientRequest.new(params).to_h
        non_body_param_names = %w[practiceId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients",
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
          Affinity::Types::CreatePatientResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns one patient in the authorized practice and mode.
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
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::GetPatientResponse]
      def get(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}",
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
          Affinity::Types::GetPatientResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires patients:write and Idempotency-Key for API keys. Permanently deletes a patient with no order history.
      # Any order history returns 409; use Update patient with status archived instead. Available to practice keys and
      # authorized platform keys. Reusing the same idempotency key returns the original deletion result.
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
      # @option params [String, nil] :idempotency_key
      # @option params [String, nil] :affinity_actor_id
      # @option params [String, nil] :affinity_actor_type
      #
      # @return [Affinity::Types::DeletePatientResponse]
      def delete(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}",
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
          Affinity::Types::DeletePatientResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a patient in the current practice and mode. Omitted fields remain unchanged; null clears an optional
      # field. externalId updates the calling integration's identifier. externalIdentities replaces its explicit
      # aliases. Identifiers cannot be reassigned from another patient. API keys require Idempotency-Key.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Patients::Types::UpdatePatientRequest]
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
      # @return [Affinity::Types::UpdatePatientResponse]
      def update(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Patients::Types::UpdatePatientRequest.new(params).to_h
        non_body_param_names = %w[practiceId patientId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key
        headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
        headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}",
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
          Affinity::Types::UpdatePatientResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Affinity::Addresses::Client]
      def addresses
        @addresses ||= Affinity::Patients::Addresses::Client.new(client: @client)
      end

      # @return [Affinity::Allergies::Client]
      def allergies
        @allergies ||= Affinity::Patients::Allergies::Client.new(client: @client)
      end
    end
  end
end
