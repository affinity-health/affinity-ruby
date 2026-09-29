# frozen_string_literal: true

module Affinity
  module Types
    class ReplayWebhookEventResponseDeliveriesItem < Internal::Types::Model
      field :automatic_attempt_count, -> { Affinity::Types::ReplayWebhookEventResponseDeliveriesItemAutomaticAttemptCount }, optional: false, nullable: false, api_name: "automaticAttemptCount"

      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :id, -> { String }, optional: false, nullable: false

      field :last_error_code, -> { String }, optional: false, nullable: true, api_name: "lastErrorCode"

      field :last_error_message, -> { String }, optional: false, nullable: true, api_name: "lastErrorMessage"

      field :next_attempt_at, -> { String }, optional: false, nullable: true, api_name: "nextAttemptAt"

      field :status, -> { Affinity::Types::ReplayWebhookEventResponseDeliveriesItemStatus }, optional: false, nullable: false
    end
  end
end
