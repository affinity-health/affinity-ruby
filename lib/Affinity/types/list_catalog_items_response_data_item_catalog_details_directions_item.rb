# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemCatalogDetailsDirectionsItem < Internal::Types::Model
      field :kind, -> { Affinity::Types::ListCatalogItemsResponseDataItemCatalogDetailsDirectionsItemKind }, optional: false, nullable: false

      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
