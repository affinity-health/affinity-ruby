# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogShippingOptionsItem < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :carrier, -> { String }, optional: false, nullable: true

      field :currency, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogShippingOptionsItemCurrency }, optional: false, nullable: false

      field :destination_types, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogShippingOptionsItemDestinationTypesItem] }, optional: false, nullable: false, api_name: "destinationTypes"

      field :estimated_days_max, -> { Integer }, optional: false, nullable: true, api_name: "estimatedDaysMax"

      field :estimated_days_min, -> { Integer }, optional: false, nullable: true, api_name: "estimatedDaysMin"

      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :service_level, -> { String }, optional: false, nullable: false, api_name: "serviceLevel"

      field :temperatures, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogShippingOptionsItemTemperaturesItem] }, optional: false, nullable: false
    end
  end
end
