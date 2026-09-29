# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequestPatientClinicalProfileWeightPounds < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderRequestPatientClinicalProfileWeightPoundsOne }
      end
    end
  end
end
