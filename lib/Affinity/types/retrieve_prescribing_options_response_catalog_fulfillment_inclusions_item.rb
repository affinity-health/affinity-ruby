# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogFulfillmentInclusionsItem < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :kind, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogFulfillmentInclusionsItemKind }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :price_component, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogFulfillmentInclusionsItemPriceComponent }, optional: false, nullable: false, api_name: "priceComponent"
    end
  end
end
