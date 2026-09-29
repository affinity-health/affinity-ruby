# frozen_string_literal: true

module Affinity
  module Account
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the platform organization, request livemode, and effective access. API keys report scopes and the
      # service_key role; dashboard sessions report membership permissions. operatingMode describes organization Live
      # access, not the credential's Test/Live mode.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :org_id
      #
      # @return [Affinity::Types::GetAccountResponse]
      def get(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["orgId"] = params[:org_id] if params.key?(:org_id)

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/account",
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
          Affinity::Types::GetAccountResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
