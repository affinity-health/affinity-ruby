# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponseFulfillmentsItemShipmentsItem < Internal::Types::Model
      field :carrier, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :delivered_at, -> { String }, optional: false, nullable: true, api_name: "deliveredAt"

      field :estimated_delivery_at, -> { String }, optional: false, nullable: true, api_name: "estimatedDeliveryAt"

      field :id, -> { String }, optional: false, nullable: false

      field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isActive"

      field :provider_status, -> { String }, optional: false, nullable: true, api_name: "providerStatus"

      field :replaced_at, -> { String }, optional: false, nullable: true, api_name: "replacedAt"

      field :replaces_shipment_id, -> { String }, optional: false, nullable: true, api_name: "replacesShipmentId"

      field :shipped_at, -> { String }, optional: false, nullable: true, api_name: "shippedAt"

      field :source, -> { Affinity::Types::GetOrderResponseFulfillmentsItemShipmentsItemSource }, optional: false, nullable: false

      field :status, -> { Affinity::Types::GetOrderResponseFulfillmentsItemShipmentsItemStatus }, optional: false, nullable: false

      field :tracking_number, -> { String }, optional: false, nullable: true, api_name: "trackingNumber"

      field :tracking_url, -> { String }, optional: false, nullable: true, api_name: "trackingUrl"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :voided_at, -> { String }, optional: false, nullable: true, api_name: "voidedAt"
    end
  end
end
