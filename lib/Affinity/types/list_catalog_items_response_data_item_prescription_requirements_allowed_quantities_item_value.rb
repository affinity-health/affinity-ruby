# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPrescriptionRequirementsAllowedQuantitiesItemValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsAllowedQuantitiesItemValueOne }
    end
  end
end
