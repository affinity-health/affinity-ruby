# frozen_string_literal: true

module Affinity
  module Types
    module SaveWebhookGrantResponseScopesItem
      extend Affinity::Internal::Types::Enum

      WEBHOOKS_READ = "webhooks:read"
      WEBHOOKS_WRITE = "webhooks:write"
    end
  end
end
