# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module UpdateOrderTestSimulationRequestScenario
        extend Affinity::Internal::Types::Enum

        SUCCESSFUL = "successful"
        PHARMACY_REJECTION = "pharmacy_rejection"
        CANCELLATION_DECLINED = "cancellation_declined"
      end
    end
  end
end
