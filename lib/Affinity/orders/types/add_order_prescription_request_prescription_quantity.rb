# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class AddOrderPrescriptionRequestPrescriptionQuantity < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::AddOrderPrescriptionRequestPrescriptionQuantityOne }
      end
    end
  end
end
