# frozen_string_literal: true

module Affinity
  module Types
    class ReplayWebhookEventResponseAttemptsItemDurationMs < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ReplayWebhookEventResponseAttemptsItemDurationMsOne }
    end
  end
end
