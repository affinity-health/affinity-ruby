# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCompositionIngredientsItemStrength < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemCompositionIngredientsItemStrengthAmount }, key: "AMOUNT"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemCompositionIngredientsItemStrengthRatio }, key: "RATIO"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemCompositionIngredientsItemStrengthUnresolved }, key: "UNRESOLVED"
    end
  end
end
