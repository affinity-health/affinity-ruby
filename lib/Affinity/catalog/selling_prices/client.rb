# frozen_string_literal: true

module Affinity
  module Catalog
    module SellingPrices
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Requires selling_prices:read. Reads the Affinity-managed purchase-price override inherited by this platform's
        # practices unless Affinity sets a practice override. Use the practice-scoped catalog for effective practice
        # prices and presentation-price when an Affinity default may be absent. Platforms cannot edit purchase prices.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :catalog_item_id
        # @option params [String, nil] :practice_id
        #
        # @return [Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponse]
        def get(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["practiceId"] = params[:practice_id] if params.key?(:practice_id)

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/catalog/items/#{URI.encode_uri_component(params[:catalog_item_id].to_s)}/selling-price",
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
            Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
