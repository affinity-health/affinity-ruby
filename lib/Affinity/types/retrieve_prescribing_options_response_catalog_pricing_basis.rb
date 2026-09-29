# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPricingBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricingBasisItem }, key: "ITEM"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricingBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricingBasisUnit }, key: "UNIT"
    end
  end
end
