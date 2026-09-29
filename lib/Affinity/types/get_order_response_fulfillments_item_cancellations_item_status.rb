# frozen_string_literal: true

module Affinity
  module Types
    module GetOrderResponseFulfillmentsItemCancellationsItemStatus
      extend Affinity::Internal::Types::Enum

      REQUESTED = "requested"
      SENT = "sent"
      CONFIRMED = "confirmed"
      REJECTED = "rejected"
      FAILED = "failed"
      TOO_LATE = "too_late"
    end
  end
end
