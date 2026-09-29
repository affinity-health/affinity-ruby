# frozen_string_literal: true

module Affinity
  module Catalog
    module ShippingOptions
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns an array of at most 50 reviewed shipping services eligible for a catalog item, destination, and API
        # mode. destinationState must be a USPS state or territory code. Each option has one temperature; pharmacy
        # catalog summaries list all supported temperatures.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :catalog_item_id
        # @option params [String] :destination_state
        # @option params [Affinity::Catalog::ShippingOptions::Types::ListShippingOptionsRequestDestinationType, nil] :destination_type
        #
        # @return [Array[Affinity::Types::ListShippingOptionsResponseItem]]
        def list(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["destinationState"] = params[:destination_state] if params.key?(:destination_state)
          query_params["destinationType"] = params[:destination_type] if params.key?(:destination_type)

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/catalog/items/#{URI.encode_uri_component(params[:catalog_item_id].to_s)}/shipping-options",
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
            Affinity::Types::ListShippingOptionsResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
