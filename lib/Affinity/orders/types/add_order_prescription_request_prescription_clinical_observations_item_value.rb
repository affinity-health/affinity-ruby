# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class AddOrderPrescriptionRequestPrescriptionClinicalObservationsItemValue < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::AddOrderPrescriptionRequestPrescriptionClinicalObservationsItemValueOne }
      end
    end
  end
end
