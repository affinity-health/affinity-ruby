# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalObservationsItemValue < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalObservationsItemValueOne }
      end
    end
  end
end
