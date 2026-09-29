# frozen_string_literal: true

module Affinity
  module Types
    module UpdateOrderTestSimulationResponseAvailableActionsItem
      extend Affinity::Internal::Types::Enum

      ACCEPT = "accept"
      PROCESS = "process"
      SHIP = "ship"
      DELIVER = "deliver"
      REJECT = "reject"
      CONFIRM_CANCELLATION = "confirm_cancellation"
      DECLINE_CANCELLATION = "decline_cancellation"
    end
  end
end
