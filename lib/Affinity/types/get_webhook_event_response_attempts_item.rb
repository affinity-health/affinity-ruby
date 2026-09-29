# frozen_string_literal: true

module Affinity
  module Types
    class GetWebhookEventResponseAttemptsItem < Internal::Types::Model
      field :delivery_id, -> { String }, optional: false, nullable: false, api_name: "deliveryId"

      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :attempt_number, -> { Integer }, optional: false, nullable: false, api_name: "attemptNumber"

      field :completed_at, -> { String }, optional: false, nullable: true, api_name: "completedAt"

      field :duration_ms, -> { Affinity::Types::GetWebhookEventResponseAttemptsItemDurationMs }, optional: false, nullable: true, api_name: "durationMs"

      field :error_code, -> { String }, optional: false, nullable: true, api_name: "errorCode"

      field :error_message, -> { String }, optional: false, nullable: true, api_name: "errorMessage"

      field :id, -> { String }, optional: false, nullable: false

      field :requested_at, -> { String }, optional: false, nullable: false, api_name: "requestedAt"

      field :response_status, -> { Affinity::Types::GetWebhookEventResponseAttemptsItemResponseStatus }, optional: false, nullable: true, api_name: "responseStatus"

      field :trigger, -> { Affinity::Types::GetWebhookEventResponseAttemptsItemTrigger }, optional: false, nullable: false
    end
  end
end
