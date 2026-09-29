# frozen_string_literal: true

module Affinity
  module Types
    module GetWebhookEventResponseStatus
      extend Affinity::Internal::Types::Enum

      DELIVERED = "delivered"
      FAILED = "failed"
      PENDING = "pending"
    end
  end
end
