# frozen_string_literal: true

module Affinity
  module Types
    module CancelOrderResponseCancellationStatus
      extend Affinity::Internal::Types::Enum

      CONFIRMED = "confirmed"
      PENDING = "pending"
      PARTIAL = "partial"
      FAILED = "failed"
    end
  end
end
