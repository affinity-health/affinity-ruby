# frozen_string_literal: true

module Affinity
  module Types
    class ReplayWebhookEventResponseAttemptsItemResponseStatus < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ReplayWebhookEventResponseAttemptsItemResponseStatusOne }
    end
  end
end
