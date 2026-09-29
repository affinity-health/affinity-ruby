# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CancelOrderRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

        field :reason, -> { String }, optional: false, nullable: false
      end
    end
  end
end
