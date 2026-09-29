# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

          field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

          field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

          field :prescriber, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestPrescriber }, optional: true, nullable: false

          field :orders, -> { Internal::Types::Array[Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
