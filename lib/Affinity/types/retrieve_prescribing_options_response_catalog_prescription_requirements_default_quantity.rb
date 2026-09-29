# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsDefaultQuantity < Internal::Types::Model
      field :unit, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsDefaultQuantityValue }, optional: false, nullable: false
    end
  end
end
