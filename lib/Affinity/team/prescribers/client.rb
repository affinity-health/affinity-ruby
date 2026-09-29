require "securerandom"
# frozen_string_literal: true

module Affinity
  module Team
    module Prescribers
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Requires team:read. Filter practice prescribers by name, NPI, state, and practice status. Records include
        # submitted licenses and their IDs. Signing authority also requires an active account connection, Live practice
        # access, and prescription eligibility.
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
        # @option params [String, nil] :search
        # @option params [String, nil] :npi
        # @option params [String, nil] :state
        # @option params [Affinity::Team::Prescribers::Types::ListPrescribersRequestStatus, nil] :status
        #
        # @return [Affinity::Types::ListPracticeTeamPrescribersResponse]
        def list(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
          query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
          query_params["search"] = params[:search] if params.key?(:search)
          query_params["npi"] = params[:npi] if params.key?(:npi)
          query_params["state"] = params[:state] if params.key?(:state)
          query_params["status"] = params[:status] if params.key?(:status)

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/prescribers",
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
            Affinity::Types::ListPracticeTeamPrescribersResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requires team:read. Returns the clinical profile and submitted licenses, including license IDs. This is setup
        # information, not a signing authorization.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :prescriber_id
        #
        # @return [Affinity::Types::GetPracticeTeamPrescriberResponse]
        def get(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/prescribers/#{URI.encode_uri_component(params[:prescriber_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Affinity::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Affinity::Types::GetPracticeTeamPrescriberResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requires team:write. Set practiceStatus to inactive to remove prescribing access in this practice, or active
        # to restore an existing association. This does not create membership or signing authority. Practice status
        # applies to Test and Live. Shared identity and license edits require Affinity support.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Team::Prescribers::Types::UpdatePracticeTeamPrescriberRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :prescriber_id
        # @option params [String, nil] :idempotency_key
        #
        # @return [Affinity::Types::UpdatePracticeTeamPrescriberResponse]
        def update(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Team::Prescribers::Types::UpdatePracticeTeamPrescriberRequest.new(params).to_h
          non_body_param_names = %w[practiceId prescriberId Idempotency-Key]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/prescribers/#{URI.encode_uri_component(params[:prescriber_id].to_s)}",
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
            Affinity::Types::UpdatePracticeTeamPrescriberResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @return [Affinity::Licenses::Client]
        def licenses
          @licenses ||= Affinity::Team::Prescribers::Licenses::Client.new(client: @client)
        end
      end
    end
  end
end
