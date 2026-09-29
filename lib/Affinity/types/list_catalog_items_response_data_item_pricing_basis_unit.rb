# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricingBasisUnit < Internal::Types::Model
      field :quantity, -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisUnitQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
