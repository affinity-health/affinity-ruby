# frozen_string_literal: true

module Affinity
  module Webhooks
    module Endpoints
      module Types
        module CreateWebhookEndpointRequestPayloadStyle
          extend Affinity::Internal::Types::Enum

          THIN = "thin"
          SNAPSHOT = "snapshot"
        end
      end
    end
  end
end
