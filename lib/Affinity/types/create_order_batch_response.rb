# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderBatchResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::CreateOrderBatchResponseObject }, optional: false, nullable: false

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :user_id, -> { String }, optional: false, nullable: true, api_name: "userId"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :orders, -> { Internal::Types::Array[Affinity::Types::CreateOrderBatchResponseOrdersItem] }, optional: false, nullable: false
    end
  end
end
