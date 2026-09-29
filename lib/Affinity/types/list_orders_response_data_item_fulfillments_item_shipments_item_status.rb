# frozen_string_literal: true

module Affinity
  module Types
    module ListOrdersResponseDataItemFulfillmentsItemShipmentsItemStatus
      extend Affinity::Internal::Types::Enum

      LABEL_CREATED = "label_created"
      CARRIER_POSSESSION = "carrier_possession"
      IN_TRANSIT = "in_transit"
      OUT_FOR_DELIVERY = "out_for_delivery"
      DELIVERED = "delivered"
      DELAYED = "delayed"
      DELIVERY_FAILED = "delivery_failed"
      RETURNED = "returned"
      VOIDED = "voided"
      UNKNOWN = "unknown"
    end
  end
end
