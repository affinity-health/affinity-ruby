# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequestPatientClinicalProfileHeightInches < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderRequestPatientClinicalProfileHeightInchesOne }
      end
    end
  end
end
