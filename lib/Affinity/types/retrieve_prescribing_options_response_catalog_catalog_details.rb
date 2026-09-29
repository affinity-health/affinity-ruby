# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCatalogDetails < Internal::Types::Model
      field :attributes, -> { Internal::Types::Hash[String, Affinity::Types::RetrievePrescribingOptionsResponseCatalogCatalogDetailsAttributesValue] }, optional: false, nullable: false

      field :directions, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogCatalogDetailsDirectionsItem] }, optional: false, nullable: false
    end
  end
end
