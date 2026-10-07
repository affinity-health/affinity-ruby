# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPricingBasisItem < Internal::Types::Model
      field :quantity, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricingBasisItemQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :quantity_prices, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricingBasisItemQuantityPricesItem] }, optional: true, nullable: false, api_name: "quantityPrices"
    end
  end
end
