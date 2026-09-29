# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemFulfillmentsItemShipping < Internal::Types::Model
      field :destination_type, -> { Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemShippingDestinationType }, optional: false, nullable: false, api_name: "destinationType"

      field :method_, -> { Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemShippingMethod }, optional: false, nullable: false, api_name: "method"

      field :option, -> { Affinity::Types::ListOrdersResponseDataItemFulfillmentsItemShippingOption }, optional: false, nullable: true
    end
  end
end
