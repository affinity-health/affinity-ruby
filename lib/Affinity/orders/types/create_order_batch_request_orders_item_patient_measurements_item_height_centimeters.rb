# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderBatchRequestOrdersItemPatientMeasurementsItemHeightCentimeters < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPatientMeasurementsItemHeightCentimetersOne }
      end
    end
  end
end
