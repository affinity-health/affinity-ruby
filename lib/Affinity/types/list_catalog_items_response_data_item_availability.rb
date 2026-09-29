# frozen_string_literal: true

module Affinity
  module Types
    module ListCatalogItemsResponseDataItemAvailability
      extend Affinity::Internal::Types::Enum

      AVAILABLE = "available"
      BACKORDERED = "backordered"
      UNAVAILABLE = "unavailable"
      UNKNOWN = "unknown"
    end
  end
end
