# frozen_string_literal: true

module Affinity
  module Types
    class ReplayWebhookEventResponse < Internal::Types::Model
      field :api_version, -> { String }, optional: false, nullable: false, api_name: "apiVersion"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :event_type, -> { String }, optional: false, nullable: false, api_name: "eventType"

      field :id, -> { String }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ReplayWebhookEventResponseObject }, optional: false, nullable: false

      field :resource_id, -> { String }, optional: false, nullable: false, api_name: "resourceId"

      field :resource_type, -> { String }, optional: false, nullable: false, api_name: "resourceType"

      field :status, -> { Affinity::Types::ReplayWebhookEventResponseStatus }, optional: false, nullable: false

      field :attempts, -> { Internal::Types::Array[Affinity::Types::ReplayWebhookEventResponseAttemptsItem] }, optional: false, nullable: false

      field :deliveries, -> { Internal::Types::Array[Affinity::Types::ReplayWebhookEventResponseDeliveriesItem] }, optional: false, nullable: false

      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
