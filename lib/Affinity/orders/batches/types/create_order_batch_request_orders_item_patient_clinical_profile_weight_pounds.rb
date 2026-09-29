# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPatientClinicalProfileWeightPounds < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { Integer }

          member -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPatientClinicalProfileWeightPoundsOne }
        end
      end
    end
  end
end
