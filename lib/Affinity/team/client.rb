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
      def register(request_options: {}, **params)
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
      def get(request_options: {}, **params)
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

      # @return [Affinity::Invitations::Client]
      def invitations
        @invitations ||= Affinity::Team::Invitations::Client.new(client: @client)
      end

      # @return [Affinity::Members::Client]
      def members
        @members ||= Affinity::Team::Members::Client.new(client: @client)
      end

      # @return [Affinity::Prescribers::Client]
      def prescribers
        @prescribers ||= Affinity::Team::Prescribers::Client.new(client: @client)
      end
    end
  end
end
