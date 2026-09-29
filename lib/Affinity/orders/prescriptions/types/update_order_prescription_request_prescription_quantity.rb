# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        class UpdateOrderPrescriptionRequestPrescriptionQuantity < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { Integer }

          member -> { Affinity::Orders::Prescriptions::Types::UpdateOrderPrescriptionRequestPrescriptionQuantityOne }
        end
      end
    end
  end
end
