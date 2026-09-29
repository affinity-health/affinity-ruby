# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCatalogDetails < Internal::Types::Model
      field :attributes, -> { Internal::Types::Hash[String, Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsAttributesValue] }, optional: false, nullable: false

      field :directions, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsDirectionsItem] }, optional: false, nullable: false
    end
  end
end
