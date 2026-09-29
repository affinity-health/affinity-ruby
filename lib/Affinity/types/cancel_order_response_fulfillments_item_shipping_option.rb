# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseFulfillmentsItemShippingOption < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :currency, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemShippingOptionCurrency }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :service_level, -> { String }, optional: false, nullable: false, api_name: "serviceLevel"

      field :temperature, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemShippingOptionTemperature }, optional: false, nullable: false
    end
  end
end
