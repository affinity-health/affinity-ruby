# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemDaysSupply < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::CancelOrderResponsePrescriptionsItemDaysSupplyOne }
    end
  end
end
