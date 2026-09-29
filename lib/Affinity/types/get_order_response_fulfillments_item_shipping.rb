# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponseFulfillmentsItemShipping < Internal::Types::Model
      field :destination_type, -> { Affinity::Types::GetOrderResponseFulfillmentsItemShippingDestinationType }, optional: false, nullable: false, api_name: "destinationType"

      field :method_, -> { Affinity::Types::GetOrderResponseFulfillmentsItemShippingMethod }, optional: false, nullable: false, api_name: "method"

      field :option, -> { Affinity::Types::GetOrderResponseFulfillmentsItemShippingOption }, optional: false, nullable: true
    end
  end
end
