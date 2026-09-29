# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogMedicationGroup < Internal::Types::Model
      field :offer_count, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogMedicationGroupOfferCount }, optional: false, nullable: false, api_name: "offerCount"

      field :pharmacy_count, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogMedicationGroupPharmacyCount }, optional: false, nullable: false, api_name: "pharmacyCount"

      field :strengths, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
