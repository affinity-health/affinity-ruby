# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPricingBasisUnit < Internal::Types::Model
      field :quantity, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricingBasisUnitQuantity }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
