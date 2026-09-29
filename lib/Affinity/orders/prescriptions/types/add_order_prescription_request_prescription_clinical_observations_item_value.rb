# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        class AddOrderPrescriptionRequestPrescriptionClinicalObservationsItemValue < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { Integer }

          member -> { Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalObservationsItemValueOne }
        end
      end
    end
  end
end
