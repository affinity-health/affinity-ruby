# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogMedicationGroupOfferCount < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogMedicationGroupOfferCountOne }
    end
  end
end
