# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemMedicationGroupPharmacyCount < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemMedicationGroupPharmacyCountOne }
    end
  end
end
