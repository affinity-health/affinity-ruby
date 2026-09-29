# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemMedicationGroupOfferCount < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemMedicationGroupOfferCountOne }
    end
  end
end
