# frozen_string_literal: true

module Affinity
  module Types
    class TestWebhookEndpointResponse < Internal::Types::Model
      field :event_id, -> { String }, optional: false, nullable: false, api_name: "eventId"
    end
  end
end
