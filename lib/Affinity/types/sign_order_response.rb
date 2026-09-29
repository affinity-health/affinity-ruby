# frozen_string_literal: true

module Affinity
  module Types
    class SignOrderResponse < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :prescriptions, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :signed_at, -> { String }, optional: false, nullable: false, api_name: "signedAt"

      field :status, -> { Affinity::Types::SignOrderResponseStatus }, optional: false, nullable: false
    end
  end
end
