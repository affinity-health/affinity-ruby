# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponsePrescriptionsItemClinicalObservationsItemValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetOrderResponsePrescriptionsItemClinicalObservationsItemValueOne }
    end
  end
end
