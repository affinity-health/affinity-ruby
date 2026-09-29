# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponsePrescriptionsItemDaysSupply < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetOrderResponsePrescriptionsItemDaysSupplyOne }
    end
  end
end
