# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsAllowedQuantitiesItem < Internal::Types::Model
      field :days_supply, -> { Integer }, optional: true, nullable: false, api_name: "daysSupply"

      field :label, -> { String }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsAllowedQuantitiesItemValue }, optional: false, nullable: false
    end
  end
end
