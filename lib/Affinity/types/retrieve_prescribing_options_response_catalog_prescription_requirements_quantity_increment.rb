# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrement < Internal::Types::Model
      field :max, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementMax }, optional: true, nullable: false

      field :min, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementMin }, optional: true, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementValue }, optional: false, nullable: false
    end
  end
end
