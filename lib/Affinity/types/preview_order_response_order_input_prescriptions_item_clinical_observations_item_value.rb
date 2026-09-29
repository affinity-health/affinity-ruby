# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPrescriptionsItemClinicalObservationsItemValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalObservationsItemValueOne }
    end
  end
end
