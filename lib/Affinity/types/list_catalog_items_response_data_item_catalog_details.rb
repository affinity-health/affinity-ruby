# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCatalogDetails < Internal::Types::Model
      field :package_components, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsPackageComponentsItem] }, optional: true, nullable: false, api_name: "packageComponents"

      field :attributes, -> { Internal::Types::Hash[String, Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsAttributesValue] }, optional: false, nullable: false

      field :directions, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsDirectionsItem] }, optional: false, nullable: false
    end
  end
end
