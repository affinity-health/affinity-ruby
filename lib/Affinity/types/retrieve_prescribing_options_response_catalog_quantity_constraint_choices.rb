# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogQuantityConstraintChoices < Internal::Types::Model
      field :quantities, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraintChoicesQuantitiesItem] }, optional: false, nullable: false
    end
  end
end
