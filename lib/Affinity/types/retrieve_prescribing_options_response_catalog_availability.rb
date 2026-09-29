# frozen_string_literal: true

module Affinity
  module Types
    module RetrievePrescribingOptionsResponseCatalogAvailability
      extend Affinity::Internal::Types::Enum

      AVAILABLE = "available"
      BACKORDERED = "backordered"
      UNAVAILABLE = "unavailable"
      UNKNOWN = "unknown"
    end
  end
end
