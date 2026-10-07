# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricingBasisItem < Internal::Types::Model
      field :quantity, -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisItemQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :quantity_prices, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisItemQuantityPricesItem] }, optional: true, nullable: false, api_name: "quantityPrices"
    end
  end
end
