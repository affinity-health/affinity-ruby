# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPrescriptionRequirementsDefaultQuantityValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsDefaultQuantityValueOne }
    end
  end
end
