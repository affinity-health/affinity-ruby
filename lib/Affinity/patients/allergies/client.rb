# frozen_string_literal: true

module Affinity
  module Patients
    module Allergies
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns the patient's structured allergy entries and review status. A not_reviewed status is not a
        # no-known-allergies assertion and blocks clinical review and signing.
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
        # @return [Affinity::Types::GetPatientAllergiesResponse]
        def get(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          headers = {}
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/allergies",
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
            Affinity::Types::GetPatientAllergiesResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Replaces the patient's structured allergy record. Sending no_known is the explicit no-known-allergies
        # acknowledgement; recorded requires at least one entry. Idempotency-Key is required.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :patient_id
        # @option params [String] :idempotency_key
        # @option params [String, nil] :affinity_actor_id
        # @option params [String, nil] :affinity_actor_type
        #
        # @return [Affinity::Types::ReplacePatientAllergiesResponse]
        def replace(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequest.new(params).to_h
          non_body_param_names = %w[practiceId patientId Idempotency-Key Affinity-Actor-Id Affinity-Actor-Type]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]
          headers["Affinity-Actor-Id"] = params[:affinity_actor_id] if params[:affinity_actor_id]
          headers["Affinity-Actor-Type"] = params[:affinity_actor_type] if params[:affinity_actor_type]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/patients/#{URI.encode_uri_component(params[:patient_id].to_s)}/allergies",
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
            Affinity::Types::ReplacePatientAllergiesResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
