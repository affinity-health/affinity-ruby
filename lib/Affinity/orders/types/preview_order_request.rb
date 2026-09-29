# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequest < Internal::Types::Model
        field :otc_items, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestOtcItemsItem] }, optional: true, nullable: false, api_name: "otcItems"

        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :patient_id, -> { String }, optional: true, nullable: false, api_name: "patientId"

        field :patient_external_id, -> { String }, optional: true, nullable: false, api_name: "patientExternalId"

        field :patient, -> { Affinity::Orders::Types::PreviewOrderRequestPatient }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

        field :prescriber, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriber }, optional: true, nullable: false

        field :shipping_address_id, -> { String }, optional: true, nullable: false, api_name: "shippingAddressId"

        field :external_order_id, -> { String }, optional: true, nullable: false, api_name: "externalOrderId"

        field :prescriptions, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItem] }, optional: false, nullable: false

        field :shipping, -> { Affinity::Orders::Types::PreviewOrderRequestShipping }, optional: true, nullable: false
      end
    end
  end
end
