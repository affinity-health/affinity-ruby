# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCatalogDetailsPackageComponentsItemContentsPerContainer < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :unit, -> { Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsPackageComponentsItemContentsPerContainerUnit }, optional: false, nullable: false
    end
  end
end
