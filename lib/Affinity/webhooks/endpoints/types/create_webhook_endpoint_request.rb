# frozen_string_literal: true

module Affinity
  module Webhooks
    module Endpoints
      module Types
        class CreateWebhookEndpointRequest < Internal::Types::Model
          field :affinity_organization_id, -> { String }, optional: true, nullable: false, api_name: "X-Affinity-Organization-Id"

          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

          field :practice_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "practiceIds"

          field :description, -> { String }, optional: true, nullable: false

          field :payload_style, -> { Affinity::Webhooks::Endpoints::Types::CreateWebhookEndpointRequestPayloadStyle }, optional: true, nullable: false, api_name: "payloadStyle"

          field :subscribed_events, -> { Internal::Types::Array[Affinity::Webhooks::Endpoints::Types::CreateWebhookEndpointRequestSubscribedEventsItem] }, optional: true, nullable: false, api_name: "subscribedEvents"

          field :url, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
