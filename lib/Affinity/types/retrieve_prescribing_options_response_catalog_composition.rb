# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogComposition < Internal::Types::Model
      field :status, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionStatus }, optional: false, nullable: false

      field :ingredients, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItem] }, optional: false, nullable: false
    end
  end
end
