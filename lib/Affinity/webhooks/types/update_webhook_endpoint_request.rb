# frozen_string_literal: true

module Affinity
  module Webhooks
    module Types
      class UpdateWebhookEndpointRequest < Internal::Types::Model
        field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

        field :affinity_organization_id, -> { String }, optional: true, nullable: false, api_name: "X-Affinity-Organization-Id"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :practice_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "practiceIds"

        field :description, -> { String }, optional: true, nullable: false

        field :payload_style, -> { Affinity::Webhooks::Types::UpdateWebhookEndpointRequestPayloadStyle }, optional: true, nullable: false, api_name: "payloadStyle"

        field :status, -> { Affinity::Webhooks::Types::UpdateWebhookEndpointRequestStatus }, optional: true, nullable: false

        field :subscribed_events, -> { Internal::Types::Array[Affinity::Webhooks::Types::UpdateWebhookEndpointRequestSubscribedEventsItem] }, optional: true, nullable: false, api_name: "subscribedEvents"

        field :url, -> { String }, optional: true, nullable: false
      end
    end
  end
end
