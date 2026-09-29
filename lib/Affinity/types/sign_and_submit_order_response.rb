# frozen_string_literal: true

module Affinity
  module Types
    class SignAndSubmitOrderResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::SignAndSubmitOrderResponseObject }, optional: false, nullable: false

      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

      field :signed_at, -> { String }, optional: false, nullable: false, api_name: "signedAt"

      field :status, -> { Affinity::Types::SignAndSubmitOrderResponseStatus }, optional: false, nullable: false

      field :prescriptions, -> { Internal::Types::Array[Affinity::Types::SignAndSubmitOrderResponsePrescriptionsItem] }, optional: false, nullable: false
    end
  end
end
