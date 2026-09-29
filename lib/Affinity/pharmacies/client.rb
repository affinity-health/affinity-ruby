# frozen_string_literal: true

module Affinity
  module Pharmacies
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Lists pharmacies available to the authenticated account, including approved invite-only relationships.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :ending_before
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :org_id
      # @option params [String, nil] :pharmacy_id
      # @option params [String, nil] :query
      # @option params [String, nil] :ships_to_state
      # @option params [String, nil] :starting_after
      #
      # @return [Affinity::Types::ListPharmaciesResponse]
      def list(request_options: {}, **params)
        params = Affinity::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["orgId"] = params[:org_id] if params.key?(:org_id)
        query_params["pharmacyId"] = params[:pharmacy_id] if params.key?(:pharmacy_id)
        query_params["query"] = params[:query] if params.key?(:query)
        query_params["shipsToState"] = params[:ships_to_state] if params.key?(:ships_to_state)
        query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)

        request = Affinity::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/pharmacies",
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
          Affinity::Types::ListPharmaciesResponse.load(response.body)
        else
          error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
