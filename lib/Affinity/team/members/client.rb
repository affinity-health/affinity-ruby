require "securerandom"
# frozen_string_literal: true

module Affinity
  module Team
    module Members
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Requires team:read. Search the roster by name or email, and filter by role or membership status. Includes
        # members invited in Clinic, location access, and account-specific prescriber connections. Memberships are
        # shared between Test and Live.
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
        # @option params [Affinity::Team::Members::Types::ListMembersRequestRole, nil] :role
        # @option params [Affinity::Team::Members::Types::ListMembersRequestStatus, nil] :status
        #
        # @return [Affinity::Types::ListPracticeTeamMembersResponse]
        def list(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
          query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
          query_params["search"] = params[:search] if params.key?(:search)
          query_params["role"] = params[:role] if params.key?(:role)
          query_params["status"] = params[:status] if params.key?(:status)

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/members",
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
            Affinity::Types::ListPracticeTeamMembersResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requires team:read. Returns current account membership, roles, location access, and prescriber connection. The
        # member ID identifies practice access; it is not the integration user ID used by orders.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :member_id
        #
        # @return [Affinity::Types::GetPracticeTeamMemberResponse]
        def get(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/members/#{URI.encode_uri_component(params[:member_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Affinity::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Affinity::Types::GetPracticeTeamMemberResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requires team:write. Supply role, status, or locationIds; omitted values stay unchanged. A role replaces
        # existing roles. Disable access with status disabled. An empty locationIds array grants all practice locations.
        # Ownership changes require an active practice owner using a personal API key; service keys manage non-owner
        # memberships. The final active owner cannot be removed. Changes apply to both Test and Live. Sign-in email and
        # account security remain account settings.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Team::Members::Types::UpdatePracticeTeamMemberRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :member_id
        # @option params [String, nil] :idempotency_key
        #
        # @return [Affinity::Types::UpdatePracticeTeamMemberResponse]
        def update(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Team::Members::Types::UpdatePracticeTeamMemberRequest.new(params).to_h
          non_body_param_names = %w[practiceId memberId Idempotency-Key]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] || SecureRandom.uuid # affinity-sdk-auto-key

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/members/#{URI.encode_uri_component(params[:member_id].to_s)}",
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
            Affinity::Types::UpdatePracticeTeamMemberResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
