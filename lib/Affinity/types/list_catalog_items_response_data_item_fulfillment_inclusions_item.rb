# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemFulfillmentInclusionsItem < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :kind, -> { Affinity::Types::ListCatalogItemsResponseDataItemFulfillmentInclusionsItemKind }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :price_component, -> { Affinity::Types::ListCatalogItemsResponseDataItemFulfillmentInclusionsItemPriceComponent }, optional: false, nullable: false, api_name: "priceComponent"
    end
  end
end
