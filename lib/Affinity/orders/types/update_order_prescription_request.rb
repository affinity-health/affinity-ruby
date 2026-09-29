# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class UpdateOrderPrescriptionRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :prescription_id, -> { String }, optional: false, nullable: false, api_name: "prescriptionId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

        field :metadata, -> { Internal::Types::Hash[String, Affinity::Orders::Types::UpdateOrderPrescriptionRequestMetadataValue] }, optional: true, nullable: false

        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :expected_revision, -> { String }, optional: true, nullable: false, api_name: "expectedRevision"

        field :expected_versions, -> { Internal::Types::Array[Affinity::Orders::Types::UpdateOrderPrescriptionRequestExpectedVersionsItem] }, optional: true, nullable: false, api_name: "expectedVersions"

        field :prescription, -> { Affinity::Orders::Types::UpdateOrderPrescriptionRequestPrescription }, optional: false, nullable: false
      end
    end
  end
end
