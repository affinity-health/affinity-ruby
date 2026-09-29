# frozen_string_literal: true

module Affinity
  module Types
    class ReplayWebhookEventResponseDeliveriesItemAutomaticAttemptCount < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ReplayWebhookEventResponseDeliveriesItemAutomaticAttemptCountOne }
    end
  end
end
