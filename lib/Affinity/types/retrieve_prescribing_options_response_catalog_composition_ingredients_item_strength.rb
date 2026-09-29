# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrength < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthAmount }, key: "AMOUNT"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthRatio }, key: "RATIO"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthUnresolved }, key: "UNRESOLVED"
    end
  end
end
