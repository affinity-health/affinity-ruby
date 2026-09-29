# frozen_string_literal: true

module Affinity
  module Types
    class GetWebhookEventResponseAttemptsItemDurationMs < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetWebhookEventResponseAttemptsItemDurationMsOne }
    end
  end
end
