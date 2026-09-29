# frozen_string_literal: true

module Affinity
  module Team
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Requires team:write and Idempotency-Key. Registers a practice member without an invitation. Test requires
      # synthetic .test emails and Affinity Test NPIs. Live requires approved integration and practice access. Identity
      # attestation records the integration's assertion; it does not verify login email or clinical credentials.
      # Existing memberships and verified provider records are preserved. Use the returned user ID for orders and
      # signing.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Team::Types::RegisterUserRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::RegisterUserResponse]
      def register_user(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Team::Types::RegisterUserRequest.new(params).to_h
        non_body_param_names = %w[practiceId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/users",
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
          Affinity::Types::RegisterUserResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires team:read. Lists practice invitations, including invitations sent in Clinic. Filter by pending,
      # expired, accepted, declined, or revoked status, exact email, or your integration externalId. Only your
      # integration and API key mode can see its external identity and onboarding state. Follow person.nextActions after
      # invitation acceptance.
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
      # @option params [Affinity::Team::Types::ListPracticeTeamInvitationsRequestStatus, nil] :status
      # @option params [String, nil] :email
      # @option params [String, nil] :external_id
      #
      # @return [Affinity::Types::ListPracticeTeamInvitationsResponse]
      def list_practice_team_invitations(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["email"] = params[:email] if params.key?(:email)
        query_params["externalId"] = params[:external_id] if params.key?(:external_id)

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/invitations",
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
          Affinity::Types::ListPracticeTeamInvitationsResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires team:write on the practice key or its platform key. Use roles to combine administrator, prescriber,
      # clinical_staff, billing, or developer presets. Ownership uses the protected owner designation. The singular role
      # field remains available for single-role assignments. Creates a real organization invitation and optional
      # prescriber setup. The recipient must accept with their Affinity account. Repeating the same external identity
      # retries pending invitation delivery. Accepted invitations do not change existing access. Team membership is
      # shared between Test and Live; the external identity is mode-scoped. Keys cannot accept invitations. Headless
      # registration and signing use separate endpoints.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Team::Types::InvitePracticeTeamPersonRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::InvitePracticeTeamPersonResponse]
      def invite_practice_team_person(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Team::Types::InvitePracticeTeamPersonRequest.new(params).to_h
        non_body_param_names = %w[practiceId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/invitations",
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
          Affinity::Types::InvitePracticeTeamPersonResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires team:read. Returns counts of members, invitations, and prescribers. Use the paginated members,
      # prescribers, and invitations collections for individual records. Team access and clinician credentials are
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
      #
      # @return [Affinity::Types::GetPracticeTeamResponse]
      def get_practice_team(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::GetPracticeTeamResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires team:read. Search the roster by name or email, and filter by role or membership status. Includes
      # members invited in Clinic, location access, and account-specific prescriber connections. Memberships are shared
      # between Test and Live.
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
      # @option params [Affinity::Team::Types::ListPracticeTeamMembersRequestRole, nil] :role
      # @option params [Affinity::Team::Types::ListPracticeTeamMembersRequestStatus, nil] :status
      #
      # @return [Affinity::Types::ListPracticeTeamMembersResponse]
      def list_practice_team_members(request_options: {}, **params)
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
      # @option params [Affinity::Team::Types::ListPracticeTeamPrescribersRequestStatus, nil] :status
      #
      # @return [Affinity::Types::ListPracticeTeamPrescribersResponse]
      def list_practice_team_prescribers(request_options: {}, **params)
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
      def get_practice_team_member(request_options: {}, **params)
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
      # @param params [Affinity::Team::Types::UpdatePracticeTeamMemberRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :member_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::UpdatePracticeTeamMemberResponse]
      def update_practice_team_member(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Team::Types::UpdatePracticeTeamMemberRequest.new(params).to_h
        non_body_param_names = %w[practiceId memberId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

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
      def get_practice_team_prescriber(request_options: {}, **params)
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

      # Requires team:write. Set practiceStatus to inactive to remove prescribing access in this practice, or active to
      # restore an existing association. This does not create membership or signing authority. Practice status applies
      # to Test and Live. Shared identity and license edits require Affinity support.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Team::Types::UpdatePracticeTeamPrescriberRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :prescriber_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::UpdatePracticeTeamPrescriberResponse]
      def update_practice_team_prescriber(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Team::Types::UpdatePracticeTeamPrescriberRequest.new(params).to_h
        non_body_param_names = %w[practiceId prescriberId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

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

      # Requires team:write and an active accepted prescriber account connection in this practice. Adds a license.
      # Expiration is optional, but must be in the future when supplied. An exact repeat returns the existing license;
      # update an existing license with PATCH and its license ID. Licenses are shared across practices and Test/Live.
      # Other licenses stay unchanged.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Team::Types::CreatePracticeTeamLicenseRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :prescriber_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::CreatePracticeTeamLicenseResponse]
      def create_practice_team_license(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Team::Types::CreatePracticeTeamLicenseRequest.new(params).to_h
        non_body_param_names = %w[practiceId prescriberId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

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

      # Requires team:write and an active accepted prescriber account connection in this practice. Correct the state or
      # license number, or set or clear the optional expiresAt value. A supplied expiration must be in the future. Other
      # licenses stay unchanged. Changes apply across practices and Test/Live.
      #
      # @param request_options [Hash]
      # @param params [Affinity::Team::Types::UpdatePracticeTeamLicenseRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :prescriber_id
      # @option params [String] :license_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::UpdatePracticeTeamLicenseResponse]
      def update_practice_team_license(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request_data = Affinity::Team::Types::UpdatePracticeTeamLicenseRequest.new(params).to_h
        non_body_param_names = %w[practiceId prescriberId licenseId Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

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

      # Requires team:read. Returns invitation status and current onboarding state for your integration. An accepted
      # invitation can still have disabled membership or pending clinical review. Invitation tokens are never returned.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :invitation_id
      #
      # @return [Affinity::Types::GetPracticeTeamInvitationResponse]
      def get_practice_team_invitation(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/invitations/#{URI.encode_uri_component(params[:invitation_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Affinity::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Affinity::Types::GetPracticeTeamInvitationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires team:write. Revokes a pending or expired invitation and its pending prescriber account connection.
      # Repeating the revoke returns the revoked invitation. Accepted invitations return 409; disable the member
      # instead. Retains invitation history.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :invitation_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::RevokePracticeTeamInvitationResponse]
      def revoke_practice_team_invitation(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/invitations/#{URI.encode_uri_component(params[:invitation_id].to_s)}",
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
          Affinity::Types::RevokePracticeTeamInvitationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Requires team:write. Resends a pending or expired invitation with the same ID, recipient, roles, and locations.
      # The previous link stops working and the new link expires in seven days. Accepted and revoked invitations return
      # 409. A 502 means the invitation was saved but email delivery could not be confirmed; retry this operation.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :practice_id
      # @option params [String] :invitation_id
      # @option params [String] :idempotency_key
      #
      # @return [Affinity::Types::ResendPracticeTeamInvitationResponse]
      def resend_practice_team_invitation(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v1/practices/#{URI.encode_uri_component(params[:practice_id].to_s)}/team/invitations/#{URI.encode_uri_component(params[:invitation_id].to_s)}/resend",
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
          Affinity::Types::ResendPracticeTeamInvitationResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
