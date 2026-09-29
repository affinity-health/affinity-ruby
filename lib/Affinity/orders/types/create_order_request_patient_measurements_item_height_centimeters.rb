# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequestPatientMeasurementsItemHeightCentimeters < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderRequestPatientMeasurementsItemHeightCentimetersOne }
      end
    end
  end
end
