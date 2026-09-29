# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthRatio < Internal::Types::Model
      field :numerator, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthRatioNumerator }, optional: false, nullable: false

      field :denominator, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthRatioDenominator }, optional: false, nullable: false
    end
  end
end
