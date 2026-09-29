# frozen_string_literal: true

module Affinity
  module Types
    class RejectOrderResponse < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :rejected_at, -> { String }, optional: false, nullable: false, api_name: "rejectedAt"

      field :reason, -> { String }, optional: false, nullable: false

      field :status, -> { Affinity::Types::RejectOrderResponseStatus }, optional: false, nullable: false
    end
  end
end
