# frozen_string_literal: true

module Affinity
  module Types
    class ListShippingOptionsResponseItem < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :carrier, -> { String }, optional: false, nullable: true

      field :currency, -> { Affinity::Types::ListShippingOptionsResponseItemCurrency }, optional: false, nullable: false

      field :estimated_days_max, -> { Integer }, optional: false, nullable: true, api_name: "estimatedDaysMax"

      field :estimated_days_min, -> { Integer }, optional: false, nullable: true, api_name: "estimatedDaysMin"

      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :service_level, -> { String }, optional: false, nullable: false, api_name: "serviceLevel"

      field :temperature, -> { Affinity::Types::ListShippingOptionsResponseItemTemperature }, optional: false, nullable: false
    end
  end
end
