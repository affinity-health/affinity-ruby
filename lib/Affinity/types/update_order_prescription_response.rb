# frozen_string_literal: true

module Affinity
  module Types
    class UpdateOrderPrescriptionResponse < Internal::Types::Model
      field :revision, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::UpdateOrderPrescriptionResponseObject }, optional: false, nullable: false

      field :external_order_id, -> { String }, optional: false, nullable: true, api_name: "externalOrderId"

      field :metadata, -> { Internal::Types::Hash[String, Affinity::Types::UpdateOrderPrescriptionResponseMetadataValue] }, optional: false, nullable: false

      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :prescription_id, -> { String }, optional: false, nullable: false, api_name: "prescriptionId"

      field :prescriptions, -> { Internal::Types::Array[Affinity::Types::UpdateOrderPrescriptionResponsePrescriptionsItem] }, optional: false, nullable: false
    end
  end
end
