# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricing < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :basis, -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasis }, optional: false, nullable: false

      field :currency, -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingCurrency }, optional: false, nullable: false

      field :medication_subtotal_cents, -> { Integer }, optional: false, nullable: false, api_name: "medicationSubtotalCents"
    end
  end
end
