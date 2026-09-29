# frozen_string_literal: true

module Affinity
  module Types
    module CancelOrderResponseCancellationOutcomesItemStatus
      extend Affinity::Internal::Types::Enum

      CONFIRMED = "confirmed"
      FAILED = "failed"
      REJECTED = "rejected"
      REQUESTED = "requested"
      SENT = "sent"
      TOO_LATE = "too_late"
    end
  end
end
