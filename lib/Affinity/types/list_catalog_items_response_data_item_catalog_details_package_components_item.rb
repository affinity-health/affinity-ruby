# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCatalogDetailsPackageComponentsItem < Internal::Types::Model
      field :container, -> { String }, optional: false, nullable: false

      field :container_count, -> { Integer }, optional: false, nullable: false, api_name: "containerCount"

      field :contents_per_container, -> { Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsPackageComponentsItemContentsPerContainer }, optional: false, nullable: false, api_name: "contentsPerContainer"
    end
  end
end
