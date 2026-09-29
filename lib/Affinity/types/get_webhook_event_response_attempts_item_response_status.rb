# frozen_string_literal: true

module Affinity
  module Types
    class GetWebhookEventResponseAttemptsItemResponseStatus < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetWebhookEventResponseAttemptsItemResponseStatusOne }
    end
  end
end
