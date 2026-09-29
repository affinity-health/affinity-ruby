# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Requires team:read. Lists practice invitations, including invitations sent in Clinic. Filter by pending,
        # expired, accepted, declined, or revoked status, exact email, or your integration externalId. Only your
        # integration and API key mode can see its external identity and onboarding state. Follow person.nextActions
        # after invitation acceptance.
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
        # @option params [Affinity::Team::Invitations::Types::ListInvitationsRequestStatus, nil] :status
        # @option params [String, nil] :email
        # @option params [String, nil] :external_id
        #
        # @return [Affinity::Types::ListPracticeTeamInvitationsResponse]
        def list(request_options: {}, **params)
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
        # clinical_staff, billing, or developer presets. Ownership uses the protected owner designation. The singular
        # role field remains available for single-role assignments. Creates a real organization invitation and optional
        # prescriber setup. The recipient must accept with their Affinity account. Repeating the same external identity
        # retries pending invitation delivery. Accepted invitations do not change existing access. Team membership is
        # shared between Test and Live; the external identity is mode-scoped. Keys cannot accept invitations. Headless
        # registration and signing use separate endpoints.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :practice_id
        # @option params [String] :idempotency_key
        #
        # @return [Affinity::Types::InvitePracticeTeamPersonResponse]
        def create(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequest.new(params).to_h
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

        # Requires team:read. Returns invitation status and current onboarding state for your integration. An accepted
        # invitation can still have disabled membership or pending clinical review. Invitation tokens are never
        # returned.
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
        def get(request_options: {}, **params)
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
        def revoke(request_options: {}, **params)
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

        # Requires team:write. Resends a pending or expired invitation with the same ID, recipient, roles, and
        # locations. The previous link stops working and the new link expires in seven days. Accepted and revoked
        # invitations return 409. A 502 means the invitation was saved but email delivery could not be confirmed; retry
        # this operation.
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
        def resend(request_options: {}, **params)
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
end
