# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCatalogDetailsPackageComponentsItemContentsPerContainer < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :unit, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCatalogDetailsPackageComponentsItemContentsPerContainerUnit }, optional: false, nullable: false
    end
  end
end
