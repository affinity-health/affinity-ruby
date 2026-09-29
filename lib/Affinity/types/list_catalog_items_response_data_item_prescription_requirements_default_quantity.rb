# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPrescriptionRequirementsDefaultQuantity < Internal::Types::Model
      field :unit, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsDefaultQuantityValue }, optional: false, nullable: false
    end
  end
end
