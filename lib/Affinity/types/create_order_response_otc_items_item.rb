# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderResponseOtcItemsItem < Internal::Types::Model
      field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

      field :name, -> { String }, optional: false, nullable: false

      field :quantity, -> { Integer }, optional: false, nullable: false

      field :unit_price_cents, -> { Integer }, optional: false, nullable: false, api_name: "unitPriceCents"

      field :subtotal_cents, -> { Integer }, optional: false, nullable: false, api_name: "subtotalCents"
    end
  end
end
