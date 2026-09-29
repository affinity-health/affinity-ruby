# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisUnit < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisUnitQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
