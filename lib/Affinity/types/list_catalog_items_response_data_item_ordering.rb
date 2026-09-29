# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemOrdering < Internal::Types::Model
      field :requires_prescription, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requiresPrescription"

      field :requires_accompanying_prescription, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requiresAccompanyingPrescription"

      field :shipping, -> { Affinity::Types::ListCatalogItemsResponseDataItemOrderingShipping }, optional: false, nullable: false
    end
  end
end
