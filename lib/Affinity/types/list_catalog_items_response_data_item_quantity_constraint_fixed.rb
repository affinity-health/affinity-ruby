# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemQuantityConstraintFixed < Internal::Types::Model
      field :quantity, -> { Affinity::Types::ListCatalogItemsResponseDataItemQuantityConstraintFixedQuantity }, optional: false, nullable: false
    end
  end
end
