# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisItem < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisItemQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :quantity_prices, -> { Internal::Types::Array[Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisItemQuantityPricesItem] }, optional: true, nullable: false, api_name: "quantityPrices"
    end
  end
end
