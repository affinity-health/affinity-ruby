# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module PreviewOrderRequestShippingSelection
        extend Affinity::Internal::Types::Enum

        MANUAL = "manual"
        LOWEST_COST = "lowest_cost"
        FASTEST = "fastest"
      end
    end
  end
end
