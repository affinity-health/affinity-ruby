# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsDefaultQuantityValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsDefaultQuantityValueOne }
    end
  end
end
