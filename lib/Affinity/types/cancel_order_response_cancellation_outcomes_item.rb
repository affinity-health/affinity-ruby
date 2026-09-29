# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseCancellationOutcomesItem < Internal::Types::Model
      field :cancellation_id, -> { String }, optional: false, nullable: false, api_name: "cancellationId"

      field :fulfillment_id, -> { String }, optional: false, nullable: false, api_name: "fulfillmentId"

      field :status, -> { Affinity::Types::CancelOrderResponseCancellationOutcomesItemStatus }, optional: false, nullable: false
    end
  end
end
