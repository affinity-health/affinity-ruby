# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseShippingGroupsItem < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :pharmacy, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :temperature, -> { Affinity::Types::PreviewOrderResponseShippingGroupsItemTemperature }, optional: false, nullable: false

      field :amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "amountCents"

      field :item_count, -> { Integer }, optional: false, nullable: false, api_name: "itemCount"

      field :prescription_indexes, -> { Internal::Types::Array[Integer] }, optional: false, nullable: false, api_name: "prescriptionIndexes"
    end
  end
end
