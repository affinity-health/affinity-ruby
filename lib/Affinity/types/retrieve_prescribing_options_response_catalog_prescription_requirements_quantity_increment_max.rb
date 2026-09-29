# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementMax < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirementsQuantityIncrementMaxOne }
    end
  end
end
