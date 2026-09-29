# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogQuantityConstraintRange < Internal::Types::Model
      field :unit, -> { String }, optional: false, nullable: false

      field :minimum, -> { String }, optional: false, nullable: true

      field :maximum, -> { String }, optional: false, nullable: true

      field :increment, -> { String }, optional: false, nullable: true
    end
  end
end
