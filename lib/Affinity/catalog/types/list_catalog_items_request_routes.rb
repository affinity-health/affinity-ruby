# frozen_string_literal: true

module Affinity
  module Catalog
    module Types
      class ListCatalogItemsRequestRoutes < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Affinity::Catalog::Types::ListCatalogItemsRequestRoutesZero }

        member -> { Internal::Types::Array[Affinity::Catalog::Types::ListCatalogItemsRequestRoutesOneItem] }
      end
    end
  end
end
