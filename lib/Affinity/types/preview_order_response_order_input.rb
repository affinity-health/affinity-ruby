# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInput < Internal::Types::Model
      field :otc_items, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputOtcItemsItem] }, optional: true, nullable: false, api_name: "otcItems"

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

      field :prescriber, -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriber }, optional: true, nullable: false

      field :shipping_address_id, -> { String }, optional: true, nullable: false, api_name: "shippingAddressId"

      field :external_order_id, -> { String }, optional: true, nullable: false, api_name: "externalOrderId"

      field :prescriptions, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItem] }, optional: false, nullable: false

      field :patient_id, -> { String }, optional: true, nullable: false, api_name: "patientId"

      field :patient, -> { Affinity::Types::PreviewOrderResponseOrderInputPatient }, optional: true, nullable: false
    end
  end
end
