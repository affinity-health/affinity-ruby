# frozen_string_literal: true

module Affinity
  module Orders
    module TestSimulation
      module Types
        module UpdateOrderTestSimulationRequestAction
          extend Affinity::Internal::Types::Enum

          SHIP = "ship"
          DELIVER = "deliver"
          ACCEPT = "accept"
          PROCESS = "process"
          REJECT = "reject"
          CONFIRM_CANCELLATION = "confirm_cancellation"
          DECLINE_CANCELLATION = "decline_cancellation"
        end
      end
    end
  end
end
