# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementValueOne }
    end
  end
end
