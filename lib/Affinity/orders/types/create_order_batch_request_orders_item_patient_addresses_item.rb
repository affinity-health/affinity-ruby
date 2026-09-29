# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderBatchRequestOrdersItemPatientAddressesItem < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :address, -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPatientAddressesItemAddress }, optional: false, nullable: false

        field :label, -> { String }, optional: false, nullable: false

        field :preferred_shipping, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "preferredShipping"

        field :recipient_name, -> { String }, optional: false, nullable: true, api_name: "recipientName"
      end
    end
  end
end
