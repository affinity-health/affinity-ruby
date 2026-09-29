# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module ListOrdersRequestStatus
        extend Affinity::Internal::Types::Enum

        BLOCKED = "blocked"
        CANCELLED = "cancelled"
        DELIVERED = "delivered"
        DRAFT = "draft"
        PARTIALLY_SUBMITTED = "partially_submitted"
        REQUIRES_PROVIDER_SIGNATURE = "requires_provider_signature"
        PROCESSING = "processing"
        READY = "ready"
        REJECTED = "rejected"
        SHIPPED = "shipped"
        SUBMITTED = "submitted"
      end
    end
  end
end
