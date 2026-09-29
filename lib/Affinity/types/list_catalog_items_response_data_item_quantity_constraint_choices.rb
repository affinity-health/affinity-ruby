# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemQuantityConstraintChoices < Internal::Types::Model
      field :quantities, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemQuantityConstraintChoicesQuantitiesItem] }, optional: false, nullable: false
    end
  end
end
