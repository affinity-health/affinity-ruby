# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemQuantity < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::CancelOrderResponsePrescriptionsItemQuantityOne }
    end
  end
end
