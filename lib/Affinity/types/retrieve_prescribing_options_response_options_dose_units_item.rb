# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseOptionsDoseUnitsItem < Internal::Types::Model
      field :label, -> { String }, optional: false, nullable: false

      field :source, -> { Affinity::Types::RetrievePrescribingOptionsResponseOptionsDoseUnitsItemSource }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
