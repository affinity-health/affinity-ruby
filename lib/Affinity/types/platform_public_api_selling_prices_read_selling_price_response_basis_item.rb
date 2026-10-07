# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadSellingPriceResponseBasisItem < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseBasisItemQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :quantity_prices, -> { Internal::Types::Array[Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseBasisItemQuantityPricesItem] }, optional: true, nullable: false, api_name: "quantityPrices"
    end
  end
end
