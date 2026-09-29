# frozen_string_literal: true

module Affinity
  module Types
    module ReplayWebhookEventResponseDeliveriesItemStatus
      extend Affinity::Internal::Types::Enum

      DELIVERED = "delivered"
      FAILED = "failed"
      PENDING = "pending"
      RETRYING = "retrying"
    end
  end
end
