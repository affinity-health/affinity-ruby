# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCatalogDetailsAttributesValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { String }

      member -> { Internal::Types::Array[String] }
    end
  end
end
