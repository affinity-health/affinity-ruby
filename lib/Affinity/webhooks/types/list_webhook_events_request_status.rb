# frozen_string_literal: true

module Affinity
  module Webhooks
    module Types
      module ListWebhookEventsRequestStatus
        extend Affinity::Internal::Types::Enum

        ALL = "all"
        DELIVERED = "delivered"
        FAILED = "failed"
        PENDING = "pending"
      end
    end
  end
end
