# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisItem < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisItemQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
