# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseFulfillmentsItemShipping < Internal::Types::Model
      field :destination_type, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemShippingDestinationType }, optional: false, nullable: false, api_name: "destinationType"

      field :method_, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemShippingMethod }, optional: false, nullable: false, api_name: "method"

      field :option, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemShippingOption }, optional: false, nullable: true
    end
  end
end
