# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderBatchResponseOrdersItem < Internal::Types::Model
      field :revision, -> { String }, optional: false, nullable: false

      field :otc_items, -> { Internal::Types::Array[Affinity::Types::CreateOrderBatchResponseOrdersItemOtcItemsItem] }, optional: false, nullable: false, api_name: "otcItems"

      field :external_order_id, -> { String }, optional: false, nullable: true, api_name: "externalOrderId"

      field :metadata, -> { Internal::Types::Hash[String, Affinity::Types::CreateOrderBatchResponseOrdersItemMetadataValue] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :id, -> { String }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :object, -> { Affinity::Types::CreateOrderBatchResponseOrdersItemObject }, optional: false, nullable: false

      field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :prescriptions, -> { Internal::Types::Array[Affinity::Types::CreateOrderBatchResponseOrdersItemPrescriptionsItem] }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: true, api_name: "userId"

      field :status, -> { Affinity::Types::CreateOrderBatchResponseOrdersItemStatus }, optional: false, nullable: false
    end
  end
end
