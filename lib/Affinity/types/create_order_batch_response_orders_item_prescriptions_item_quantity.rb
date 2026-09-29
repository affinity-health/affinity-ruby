# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderBatchResponseOrdersItemPrescriptionsItemQuantity < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::CreateOrderBatchResponseOrdersItemPrescriptionsItemQuantityOne }
    end
  end
end
