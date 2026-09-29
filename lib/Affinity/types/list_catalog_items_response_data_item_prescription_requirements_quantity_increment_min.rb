# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrementMin < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrementMinOne }
    end
  end
end
