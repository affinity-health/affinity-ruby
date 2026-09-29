# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItem < Internal::Types::Model
          field :otc_items, -> { Internal::Types::Array[Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemOtcItemsItem] }, optional: true, nullable: false, api_name: "otcItems"

          field :external_order_id, -> { String }, optional: true, nullable: false, api_name: "externalOrderId"

          field :metadata, -> { Internal::Types::Hash[String, Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemMetadataValue] }, optional: true, nullable: false

          field :patient_id, -> { String }, optional: true, nullable: false, api_name: "patientId"

          field :patient, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPatient }, optional: true, nullable: false

          field :shipping_address_id, -> { String }, optional: true, nullable: false, api_name: "shippingAddressId"

          field :prescriptions, -> { Internal::Types::Array[Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
