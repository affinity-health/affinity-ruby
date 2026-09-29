# frozen_string_literal: true

module Affinity
  module Pharmacies
    module Types
      class ListPharmaciesRequest < Internal::Types::Model
        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :org_id, -> { String }, optional: true, nullable: false, api_name: "orgId"

        field :pharmacy_id, -> { String }, optional: true, nullable: false, api_name: "pharmacyId"

        field :query, -> { String }, optional: true, nullable: false

        field :ships_to_state, -> { String }, optional: true, nullable: false, api_name: "shipsToState"

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"
      end
    end
  end
end
