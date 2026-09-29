# frozen_string_literal: true

module Affinity
  module Types
    class SignAndSubmitOrderResponsePrescriptionsItem < Internal::Types::Model
      field :prescription_id, -> { String }, optional: false, nullable: false, api_name: "prescriptionId"

      field :status, -> { Affinity::Types::SignAndSubmitOrderResponsePrescriptionsItemStatus }, optional: false, nullable: false

      field :fulfillment_order_id, -> { String }, optional: false, nullable: true, api_name: "fulfillmentOrderId"

      field :error, -> { Affinity::Types::SignAndSubmitOrderResponsePrescriptionsItemError }, optional: false, nullable: true
    end
  end
end
