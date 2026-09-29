# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemPrescriptionsItemQuantity < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemQuantityOne }
    end
  end
end
