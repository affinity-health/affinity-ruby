# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        module ListItemsRequestAvailability
          extend Affinity::Internal::Types::Enum

          ALL = "all"
          ORDERABLE = "orderable"
          UNAVAILABLE = "unavailable"
        end
      end
    end
  end
end
