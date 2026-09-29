# frozen_string_literal: true

module Affinity
  module Webhooks
    module Types
      class GetWebhookEventRequest < Internal::Types::Model
        field :event_id, -> { String }, optional: false, nullable: false, api_name: "eventId"

        field :affinity_organization_id, -> { String }, optional: true, nullable: false, api_name: "X-Affinity-Organization-Id"
      end
    end
  end
end
