require "securerandom"
# frozen_string_literal: true

module Affinity
  module Team
    module Prescribers
      module Licenses
        class Client
          # @param client [Affinity::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Requires team:write and an active accepted prescriber account connection in this practice. Adds a license.
          # Expiration is optional, but must be in the future when supplied. An exact repeat returns the existing
          # license; update an existing license with PATCH and its license ID. Licenses are shared across practices and
          # Test/Live. Other licenses stay unchanged.
          #
          # @param request_options [Hash]
          # @param params [Affinity::Team::Prescribers::Licenses::Types::CreatePracticeTeamLicenseRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :practice_id
          # @option params [String] :prescriber_id
          # @option params [String, nil] :idempotency_key
          #
          # @return [Affinity::Types::CreatePracticeTeamLicenseResponse]
          def create(request_options: {}, **params)
            params = Affinity::Internal::Types::Utils.normalize_keys(params)
            request_data = Affinity::Team::Prescribers::Licenses::Types::CreatePracticeTeamLicenseRequest.new(params).to_h
            non_body_param_names = %w[practiceId prescriberId Idempotency-Key]
            body = request_data.except(*non_body_param_names)

            headers = {}
            headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

            request = Affinity::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/prescribers/#{URI.encode_uri_component(params[:prescriber_id].to_s)}/licenses",
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
              Affinity::Types::CreatePracticeTeamLicenseResponse.load(response.body)
            else
              error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Requires team:write and an active accepted prescriber account connection in this practice. Correct the state
          # or license number, or set or clear the optional expiresAt value. A supplied expiration must be in the
          # future. Other licenses stay unchanged. Changes apply across practices and Test/Live.
          #
          # @param request_options [Hash]
          # @param params [Affinity::Team::Prescribers::Licenses::Types::UpdatePracticeTeamLicenseRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :practice_id
          # @option params [String] :prescriber_id
          # @option params [String] :license_id
          # @option params [String, nil] :idempotency_key
          #
          # @return [Affinity::Types::UpdatePracticeTeamLicenseResponse]
          def update(request_options: {}, **params)
            params = Affinity::Internal::Types::Utils.normalize_keys(params)
            request_data = Affinity::Team::Prescribers::Licenses::Types::UpdatePracticeTeamLicenseRequest.new(params).to_h
            non_body_param_names = %w[practiceId prescriberId licenseId Idempotency-Key]
            body = request_data.except(*non_body_param_names)

            headers = {}
            headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

            request = Affinity::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/prescribers/#{URI.encode_uri_component(params[:prescriber_id].to_s)}/licenses/#{URI.encode_uri_component(params[:license_id].to_s)}",
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
              Affinity::Types::UpdatePracticeTeamLicenseResponse.load(response.body)
            else
              error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
