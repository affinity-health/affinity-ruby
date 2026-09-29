# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogMedicationGroupPharmacyCount < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogMedicationGroupPharmacyCountOne }
    end
  end
end
