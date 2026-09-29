# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogCatalogDetailsDirectionsItem < Internal::Types::Model
      field :kind, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCatalogDetailsDirectionsItemKind }, optional: false, nullable: false

      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
