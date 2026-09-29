# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrement < Internal::Types::Model
      field :max, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrementMax }, optional: true, nullable: false

      field :min, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrementMin }, optional: true, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrementValue }, optional: false, nullable: false
    end
  end
end
