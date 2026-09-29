# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

        field :prescriber, -> { Affinity::Orders::Types::CreateOrderRequestPrescriber }, optional: true, nullable: false

        field :otc_items, -> { Internal::Types::Array[Affinity::Orders::Types::CreateOrderRequestOtcItemsItem] }, optional: true, nullable: false, api_name: "otcItems"

        field :external_order_id, -> { String }, optional: true, nullable: false, api_name: "externalOrderId"

        field :metadata, -> { Internal::Types::Hash[String, Affinity::Orders::Types::CreateOrderRequestMetadataValue] }, optional: true, nullable: false

        field :patient_id, -> { String }, optional: true, nullable: false, api_name: "patientId"

        field :patient, -> { Affinity::Orders::Types::CreateOrderRequestPatient }, optional: true, nullable: false

        field :shipping_address_id, -> { String }, optional: true, nullable: false, api_name: "shippingAddressId"

        field :prescriptions, -> { Internal::Types::Array[Affinity::Orders::Types::CreateOrderRequestPrescriptionsItem] }, optional: false, nullable: false
      end
    end
  end
end
