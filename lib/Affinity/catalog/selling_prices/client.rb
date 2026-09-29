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

        # Requires selling_prices:read. Omit practiceId for the platform default, or supply a managed practice. A null
        # amount inherits the next applicable price. Amounts use the catalog pricing basis, in USD cents.
        # purchaseAmountCents is the platform's Affinity purchase price for that same basis. requiresReview indicates
        # changed product pricing terms, not a below-purchase-price discount.
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

        # Requires selling_prices:write. Sets a platform default or managed practice override in the current Test/Live
        # mode. Send baseVersion from Read selling price. Null removes the override. Prices use the catalog pricing
        # basis. Intentional discounts below purchaseAmountCents are allowed; compare these amounts to warn about
        # selling below your Affinity purchase price. This does not change the platform's Affinity purchase price or
        # collect practice payments.
        #
        # @param request_options [Hash]
        # @param params [Affinity::Catalog::SellingPrices::Types::PlatformPublicAPISellingPricesUpdateSellingPriceRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :catalog_item_id
        # @option params [String] :idempotency_key
        #
        # @return [Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponse]
        def update(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          request_data = Affinity::Catalog::SellingPrices::Types::PlatformPublicAPISellingPricesUpdateSellingPriceRequest.new(params).to_h
          non_body_param_names = %w[catalogItemId Idempotency-Key]
          body = request_data.except(*non_body_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v1/catalog/items/#{URI.encode_uri_component(params[:catalog_item_id].to_s)}/selling-price",
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
            Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
