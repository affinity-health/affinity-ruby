# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        class ListItemsRequest < Internal::Types::Model
          field :view, -> { Affinity::Catalog::Items::Types::ListItemsRequestView }, optional: true, nullable: false

          field :related_to_catalog_item_id, -> { String }, optional: true, nullable: false, api_name: "relatedToCatalogItemId"

          field :catalog_kind, -> { Affinity::Catalog::Items::Types::ListItemsRequestCatalogKind }, optional: true, nullable: false, api_name: "catalogKind"

          field :sort, -> { Affinity::Catalog::Items::Types::ListItemsRequestSort }, optional: true, nullable: false

          field :catalog_item_id, -> { String }, optional: true, nullable: false, api_name: "catalogItemId"

          field :availability, -> { Affinity::Catalog::Items::Types::ListItemsRequestAvailability }, optional: true, nullable: false

          field :pharmacy_ids, -> { Affinity::Catalog::Items::Types::ListItemsRequestPharmacyIDs }, optional: true, nullable: false, api_name: "pharmacyIds"

          field :dosage_forms, -> { Affinity::Catalog::Items::Types::ListItemsRequestDosageForms }, optional: true, nullable: false, api_name: "dosageForms"

          field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

          field :hide_controlled_substances, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hideControlledSubstances"

          field :hide_unpriced, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hideUnpriced"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :org_id, -> { String }, optional: true, nullable: false, api_name: "orgId"

          field :practice_id, -> { String }, optional: true, nullable: false, api_name: "practiceId"

          field :query, -> { String }, optional: true, nullable: false

          field :requirement, -> { Affinity::Catalog::Items::Types::ListItemsRequestRequirement }, optional: true, nullable: false

          field :routes, -> { Affinity::Catalog::Items::Types::ListItemsRequestRoutes }, optional: true, nullable: false

          field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"
        end
      end
    end
  end
end
