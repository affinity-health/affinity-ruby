# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :role, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemRole }, optional: false, nullable: false

      field :basis_of_strength_substance, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemBasisOfStrengthSubstance }, optional: false, nullable: true, api_name: "basisOfStrengthSubstance"

      field :strength, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrength }, optional: false, nullable: false
    end
  end
end
