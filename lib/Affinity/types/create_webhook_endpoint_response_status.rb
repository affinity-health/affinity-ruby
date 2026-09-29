# frozen_string_literal: true

module Affinity
  module Types
    module CreateWebhookEndpointResponseStatus
      extend Affinity::Internal::Types::Enum

      ACTIVE = "active"
      SUSPENDED = "suspended"
      DISABLED = "disabled"
    end
  end
end
