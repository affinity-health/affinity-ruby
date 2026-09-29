# frozen_string_literal: true

module Affinity
  module Types
    class ReplayWebhookEventResponseAttemptsItem < Internal::Types::Model
      field :delivery_id, -> { String }, optional: false, nullable: false, api_name: "deliveryId"

      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :attempt_number, -> { Integer }, optional: false, nullable: false, api_name: "attemptNumber"

      field :completed_at, -> { String }, optional: false, nullable: true, api_name: "completedAt"

      field :duration_ms, -> { Affinity::Types::ReplayWebhookEventResponseAttemptsItemDurationMs }, optional: false, nullable: true, api_name: "durationMs"

      field :error_code, -> { String }, optional: false, nullable: true, api_name: "errorCode"

      field :error_message, -> { String }, optional: false, nullable: true, api_name: "errorMessage"

      field :id, -> { String }, optional: false, nullable: false

      field :requested_at, -> { String }, optional: false, nullable: false, api_name: "requestedAt"

      field :response_status, -> { Affinity::Types::ReplayWebhookEventResponseAttemptsItemResponseStatus }, optional: false, nullable: true, api_name: "responseStatus"

      field :trigger, -> { Affinity::Types::ReplayWebhookEventResponseAttemptsItemTrigger }, optional: false, nullable: false
    end
  end
end
