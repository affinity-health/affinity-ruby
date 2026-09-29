# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponsePresetsItemQuantity < Internal::Types::Model
      field :value, -> { Integer }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
