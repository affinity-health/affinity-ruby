# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadPresentationPriceResponseBasisUnit < Internal::Types::Model
      field :quantity, -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseBasisUnitQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
