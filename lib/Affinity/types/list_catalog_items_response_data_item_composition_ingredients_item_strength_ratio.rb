# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCompositionIngredientsItemStrengthRatio < Internal::Types::Model
      field :numerator, -> { Affinity::Types::ListCatalogItemsResponseDataItemCompositionIngredientsItemStrengthRatioNumerator }, optional: false, nullable: false

      field :denominator, -> { Affinity::Types::ListCatalogItemsResponseDataItemCompositionIngredientsItemStrengthRatioDenominator }, optional: false, nullable: false
    end
  end
end
