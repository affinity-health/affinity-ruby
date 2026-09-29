# frozen_string_literal: true

module Affinity
  module Webhooks
    module Types
      module UpdateWebhookEndpointRequestStatus
        extend Affinity::Internal::Types::Enum

        ACTIVE = "active"
        SUSPENDED = "suspended"
        DISABLED = "disabled"
      end
    end
  end
end
