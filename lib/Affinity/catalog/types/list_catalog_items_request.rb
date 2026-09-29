# frozen_string_literal: true

module Affinity
  module Catalog
    module Types
      class ListCatalogItemsRequest < Internal::Types::Model
        field :view, -> { Affinity::Catalog::Types::ListCatalogItemsRequestView }, optional: true, nullable: false

        field :related_to_catalog_item_id, -> { String }, optional: true, nullable: false, api_name: "relatedToCatalogItemId"

        field :catalog_kind, -> { Affinity::Catalog::Types::ListCatalogItemsRequestCatalogKind }, optional: true, nullable: false, api_name: "catalogKind"

        field :sort, -> { Affinity::Catalog::Types::ListCatalogItemsRequestSort }, optional: true, nullable: false

        field :catalog_item_id, -> { String }, optional: true, nullable: false, api_name: "catalogItemId"

        field :availability, -> { Affinity::Catalog::Types::ListCatalogItemsRequestAvailability }, optional: true, nullable: false

        field :pharmacy_ids, -> { Affinity::Catalog::Types::ListCatalogItemsRequestPharmacyIDs }, optional: true, nullable: false, api_name: "pharmacyIds"

        field :dosage_forms, -> { Affinity::Catalog::Types::ListCatalogItemsRequestDosageForms }, optional: true, nullable: false, api_name: "dosageForms"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :hide_controlled_substances, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hideControlledSubstances"

        field :hide_unpriced, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hideUnpriced"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :org_id, -> { String }, optional: true, nullable: false, api_name: "orgId"

        field :practice_id, -> { String }, optional: true, nullable: false, api_name: "practiceId"

        field :query, -> { String }, optional: true, nullable: false

        field :requirement, -> { Affinity::Catalog::Types::ListCatalogItemsRequestRequirement }, optional: true, nullable: false

        field :routes, -> { Affinity::Catalog::Types::ListCatalogItemsRequestRoutes }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"
      end
    end
  end
end
