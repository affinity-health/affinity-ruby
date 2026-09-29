# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricingBasisItem < Internal::Types::Model
      field :quantity, -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisItemQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
