# frozen_string_literal: true

module Affinity
  module Catalog
    module Types
      module ListCatalogItemsRequestAvailability
        extend Affinity::Internal::Types::Enum

        ALL = "all"
        ORDERABLE = "orderable"
        UNAVAILABLE = "unavailable"
      end
    end
  end
end
