# frozen_string_literal: true

module Affinity
  module Types
    module GetOrderTestSimulationResponseScenario
      extend Affinity::Internal::Types::Enum

      SUCCESSFUL = "successful"
      PHARMACY_REJECTION = "pharmacy_rejection"
      CANCELLATION_DECLINED = "cancellation_declined"
    end
  end
end
