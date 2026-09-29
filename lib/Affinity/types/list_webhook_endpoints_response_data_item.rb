# frozen_string_literal: true

module Affinity
  module Types
    class ListWebhookEndpointsResponseDataItem < Internal::Types::Model
      field :organization_id, -> { String }, optional: false, nullable: false, api_name: "organizationId"

      field :practice_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "practiceIds"

      field :api_version, -> { String }, optional: false, nullable: false, api_name: "apiVersion"

      field :consecutive_failures, -> { Integer }, optional: false, nullable: false, api_name: "consecutiveFailures"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :description, -> { String }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListWebhookEndpointsResponseDataItemObject }, optional: false, nullable: false

      field :payload_style, -> { Affinity::Types::ListWebhookEndpointsResponseDataItemPayloadStyle }, optional: false, nullable: false, api_name: "payloadStyle"

      field :status, -> { Affinity::Types::ListWebhookEndpointsResponseDataItemStatus }, optional: false, nullable: false

      field :subscribed_events, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "subscribedEvents"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
