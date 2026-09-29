# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      class Client
        # @param client [Affinity::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists catalog items for the authenticated account and mode. Use view=medications for priced prescription
        # groups with offer counts, pharmacy counts, and strengths; the default view=offers returns individual offers.
        # Use relatedToCatalogItemId to find offers for the same medication and route. When practiceId is supplied, a
        # practice price overrides the platform price and missing overrides inherit the platform price.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestView, nil] :view
        # @option params [String, nil] :related_to_catalog_item_id
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestCatalogKind, nil] :catalog_kind
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestSort, nil] :sort
        # @option params [String, nil] :catalog_item_id
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestAvailability, nil] :availability
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestPharmacyIDs, nil] :pharmacy_ids
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestDosageForms, nil] :dosage_forms
        # @option params [String, nil] :ending_before
        # @option params [Boolean, nil] :hide_controlled_substances
        # @option params [Boolean, nil] :hide_unpriced
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :org_id
        # @option params [String, nil] :practice_id
        # @option params [String, nil] :query
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestRequirement, nil] :requirement
        # @option params [Affinity::Catalog::Items::Types::ListItemsRequestRoutes, nil] :routes
        # @option params [String, nil] :starting_after
        #
        # @return [Affinity::Types::ListCatalogItemsResponse]
        def list(request_options: {}, **params)
          params = Affinity::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["view"] = params[:view] if params.key?(:view)
          query_params["relatedToCatalogItemId"] = params[:related_to_catalog_item_id] if params.key?(:related_to_catalog_item_id)
          query_params["catalogKind"] = params[:catalog_kind] if params.key?(:catalog_kind)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["catalogItemId"] = params[:catalog_item_id] if params.key?(:catalog_item_id)
          query_params["availability"] = params[:availability] if params.key?(:availability)
          query_params["pharmacyIds"] = params[:pharmacy_ids] if params.key?(:pharmacy_ids)
          query_params["dosageForms"] = params[:dosage_forms] if params.key?(:dosage_forms)
          query_params["endingBefore"] = params[:ending_before] if params.key?(:ending_before)
          query_params["hideControlledSubstances"] = params[:hide_controlled_substances] if params.key?(:hide_controlled_substances)
          query_params["hideUnpriced"] = params[:hide_unpriced] if params.key?(:hide_unpriced)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["orgId"] = params[:org_id] if params.key?(:org_id)
          query_params["practiceId"] = params[:practice_id] if params.key?(:practice_id)
          query_params["query"] = params[:query] if params.key?(:query)
          query_params["requirement"] = params[:requirement] if params.key?(:requirement)
          query_params["routes"] = params[:routes] if params.key?(:routes)
          query_params["startingAfter"] = params[:starting_after] if params.key?(:starting_after)

          request = Affinity::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v1/catalog/items",
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
            Affinity::Types::ListCatalogItemsResponse.load(response.body)
          else
            error_class = Affinity::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
