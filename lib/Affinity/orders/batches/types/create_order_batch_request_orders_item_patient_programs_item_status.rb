# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        module CreateOrderBatchRequestOrdersItemPatientProgramsItemStatus
          extend Affinity::Internal::Types::Enum

          ACTIVE = "active"
          COMPLETED = "completed"
          PAUSED = "paused"
        end
      end
    end
  end
end
