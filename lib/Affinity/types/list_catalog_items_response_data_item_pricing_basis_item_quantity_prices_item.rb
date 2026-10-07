# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricingBasisItemQuantityPricesItem < Internal::Types::Model
      field :quantity, -> { String }, optional: false, nullable: false

      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"
    end
  end
end
