# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasisUnit < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasisUnitQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
