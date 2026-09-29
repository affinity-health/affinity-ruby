# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPatientMeasurementsItemHeightCentimeters < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::PreviewOrderRequestPatientMeasurementsItemHeightCentimetersOne }
      end
    end
  end
end
