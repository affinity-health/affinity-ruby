# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisUnit < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisUnitQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
