# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderBatchRequestOrdersItemPrescriptionsItemQuantity < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemQuantityOne }
      end
    end
  end
end
