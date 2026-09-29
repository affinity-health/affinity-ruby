# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        class ListItemsRequestPharmacyIDs < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { String }

          member -> { Internal::Types::Array[String] }
        end
      end
    end
  end
end
