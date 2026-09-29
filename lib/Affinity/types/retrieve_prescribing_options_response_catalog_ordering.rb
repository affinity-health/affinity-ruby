# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogOrdering < Internal::Types::Model
      field :requires_prescription, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requiresPrescription"

      field :requires_accompanying_prescription, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requiresAccompanyingPrescription"

      field :shipping, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogOrderingShipping }, optional: false, nullable: false
    end
  end
end
