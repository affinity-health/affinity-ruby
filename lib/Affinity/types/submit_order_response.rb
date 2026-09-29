# frozen_string_literal: true

module Affinity
  module Types
    class SubmitOrderResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::SubmitOrderResponseObject }, optional: false, nullable: false

      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :status, -> { Affinity::Types::SubmitOrderResponseStatus }, optional: false, nullable: false
    end
  end
end
