# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponsePrescriptionsItemQuantity < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetOrderResponsePrescriptionsItemQuantityOne }
    end
  end
end
