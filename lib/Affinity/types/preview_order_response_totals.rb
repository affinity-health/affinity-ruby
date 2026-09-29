# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseTotals < Internal::Types::Model
      field :currency, -> { Affinity::Types::PreviewOrderResponseTotalsCurrency }, optional: false, nullable: false

      field :medication_subtotal_cents, -> { Integer }, optional: false, nullable: true, api_name: "medicationSubtotalCents"

      field :supply_subtotal_cents, -> { Integer }, optional: false, nullable: true, api_name: "supplySubtotalCents"

      field :shipping_total_cents, -> { Integer }, optional: false, nullable: true, api_name: "shippingTotalCents"

      field :estimated_total_cents, -> { Integer }, optional: false, nullable: true, api_name: "estimatedTotalCents"
    end
  end
end
