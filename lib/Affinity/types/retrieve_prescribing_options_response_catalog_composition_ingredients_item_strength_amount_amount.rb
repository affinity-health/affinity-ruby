# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCompositionIngredientsItemStrengthAmountAmount < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
