# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        class ListItemsRequestRoutes < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { Affinity::Catalog::Items::Types::ListItemsRequestRoutesZero }

          member -> { Internal::Types::Array[Affinity::Catalog::Items::Types::ListItemsRequestRoutesOneItem] }
        end
      end
    end
  end
end
