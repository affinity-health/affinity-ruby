# frozen_string_literal: true

module Affinity
  module Types
    module GetOrderResponseLifecycleEventsItemSource
      extend Affinity::Internal::Types::Enum

      CANCELLATION = "cancellation"
      EXCEPTION = "exception"
      FULFILLMENT = "fulfillment"
      INTEGRATION = "integration"
      SHIPMENT = "shipment"
      WEBHOOK = "webhook"
    end
  end
end
