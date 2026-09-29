# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPatientClinicalProfileWeightPounds < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::PreviewOrderRequestPatientClinicalProfileWeightPoundsOne }
      end
    end
  end
end
