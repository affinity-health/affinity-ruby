# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriptionsItemOverrides < Internal::Types::Model
        field :sig, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesSig }, optional: true, nullable: false

        field :quantity, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesQuantity }, optional: true, nullable: false

        field :days_supply, -> { Integer }, optional: true, nullable: false, api_name: "daysSupply"

        field :refills, -> { Integer }, optional: true, nullable: false

        field :clinical, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesClinical }, optional: true, nullable: false

        field :dispensing, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesDispensing }, optional: true, nullable: false
      end
    end
  end
end
