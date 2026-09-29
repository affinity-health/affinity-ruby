# frozen_string_literal: true

module Affinity
  module Webhooks
    module Endpoints
      module Types
        module UpdateWebhookEndpointRequestPayloadStyle
          extend Affinity::Internal::Types::Enum

          THIN = "thin"
          SNAPSHOT = "snapshot"
        end
      end
    end
  end
end
