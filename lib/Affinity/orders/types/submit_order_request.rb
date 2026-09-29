# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class SubmitOrderRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

        field :prescriber, -> { Affinity::Orders::Types::SubmitOrderRequestPrescriber }, optional: true, nullable: false
      end
    end
  end
end
