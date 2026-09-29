# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPatientClinicalProfileHeightInches < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::PreviewOrderRequestPatientClinicalProfileHeightInchesOne }
      end
    end
  end
end
