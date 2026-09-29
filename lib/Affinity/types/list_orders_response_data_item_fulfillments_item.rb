# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemFulfillmentsItem < Internal::Types::Model
      field :carrier, -> { String }, optional: false, nullable: true

      field :cancellations, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemCancellationsItem] }, optional: false, nullable: false

      field :pharmacy_id, -> { String }, optional: false, nullable: true, api_name: "pharmacyId"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :id, -> { String }, optional: false, nullable: false

      field :prescription_id, -> { String }, optional: false, nullable: false, api_name: "prescriptionId"

      field :status, -> { String }, optional: false, nullable: false

      field :tracking_number, -> { String }, optional: false, nullable: true, api_name: "trackingNumber"

      field :tracking_status, -> { String }, optional: false, nullable: true, api_name: "trackingStatus"

      field :shipped_at, -> { String }, optional: false, nullable: true, api_name: "shippedAt"

      field :delivered_at, -> { String }, optional: false, nullable: true, api_name: "deliveredAt"

      field :estimated_delivery_at, -> { String }, optional: false, nullable: true, api_name: "estimatedDeliveryAt"

      field :exceptions, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemExceptionsItem] }, optional: false, nullable: false

      field :shipping, -> { Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemShipping }, optional: false, nullable: false

      field :shipments, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemShipmentsItem] }, optional: false, nullable: false

      field :tracking_url, -> { String }, optional: false, nullable: true, api_name: "trackingUrl"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
