# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPatientMeasurementsItemWeightKilograms < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { Integer }

          member -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPatientMeasurementsItemWeightKilogramsOne }
        end
      end
    end
  end
end
