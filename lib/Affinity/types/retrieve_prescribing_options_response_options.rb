# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseOptions < Internal::Types::Model
      field :dose_units, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseOptionsDoseUnitsItem] }, optional: false, nullable: false, api_name: "doseUnits"

      field :doses, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseOptionsDosesItem] }, optional: false, nullable: false

      field :frequencies, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseOptionsFrequenciesItem] }, optional: false, nullable: false

      field :routes, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseOptionsRoutesItem] }, optional: false, nullable: false
    end
  end
end
