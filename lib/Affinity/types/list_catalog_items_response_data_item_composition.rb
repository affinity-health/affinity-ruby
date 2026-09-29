# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemComposition < Internal::Types::Model
      field :status, -> { Affinity::Types::ListCatalogItemsResponseDataItemCompositionStatus }, optional: false, nullable: false

      field :ingredients, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemCompositionIngredientsItem] }, optional: false, nullable: false
    end
  end
end
