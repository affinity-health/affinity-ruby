# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponsePrescriptionsItem < Internal::Types::Model
      field :medication_id, -> { String }, optional: false, nullable: false, api_name: "medicationId"

      field :revision, -> { String }, optional: false, nullable: false

      field :directions, -> { String }, optional: false, nullable: false

      field :structured_sig, -> { Affinity::Types::PreviewOrderResponsePrescriptionsItemStructuredSig }, optional: false, nullable: true, api_name: "structuredSig"

      field :format, -> { Affinity::Types::PreviewOrderResponsePrescriptionsItemFormat }, optional: false, nullable: false

      field :quantity, -> { Affinity::Types::PreviewOrderResponsePrescriptionsItemQuantity }, optional: false, nullable: true

      field :days_supply, -> { Integer }, optional: false, nullable: true, api_name: "daysSupply"

      field :days_supply_source, -> { Affinity::Types::PreviewOrderResponsePrescriptionsItemDaysSupplySource }, optional: false, nullable: false, api_name: "daysSupplySource"

      field :refills, -> { Integer }, optional: false, nullable: false

      field :shipping_options, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponsePrescriptionsItemShippingOptionsItem] }, optional: false, nullable: false, api_name: "shippingOptions"

      field :shipping_option_id, -> { String }, optional: false, nullable: true, api_name: "shippingOptionId"

      field :medication_subtotal_cents, -> { Integer }, optional: false, nullable: true, api_name: "medicationSubtotalCents"

      field :shipping_amount_cents, -> { Integer }, optional: false, nullable: true, api_name: "shippingAmountCents"
    end
  end
end
