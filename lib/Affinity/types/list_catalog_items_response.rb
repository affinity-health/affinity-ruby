# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListCatalogItemsResponseObject }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :url, -> { Affinity::Types::ListCatalogItemsResponseURL }, optional: false, nullable: false
    end
  end
end
