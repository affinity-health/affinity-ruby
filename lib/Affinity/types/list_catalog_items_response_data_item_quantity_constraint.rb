# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemQuantityConstraint < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemQuantityConstraintFixed }, key: "FIXED"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemQuantityConstraintChoices }, key: "CHOICES"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemQuantityConstraintRange }, key: "RANGE"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemQuantityConstraintUnresolved }, key: "UNRESOLVED"
    end
  end
end
