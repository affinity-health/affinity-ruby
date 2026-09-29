# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderBatchRequestOrdersItemPatientClinicalProfileHeightInches < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPatientClinicalProfileHeightInchesOne }
      end
    end
  end
end
