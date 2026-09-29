# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class RejectOrderRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

        field :prescriber, -> { Affinity::Orders::Types::RejectOrderRequestPrescriber }, optional: true, nullable: false

        field :reason, -> { String }, optional: false, nullable: false

        field :expected_revision, -> { String }, optional: true, nullable: false, api_name: "expectedRevision"

        field :expected_versions, -> { Internal::Types::Array[Affinity::Orders::Types::RejectOrderRequestExpectedVersionsItem] }, optional: true, nullable: false, api_name: "expectedVersions"
      end
    end
  end
end
