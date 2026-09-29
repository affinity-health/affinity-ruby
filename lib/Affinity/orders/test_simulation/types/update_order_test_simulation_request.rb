# frozen_string_literal: true

module Affinity
  module Orders
    module TestSimulation
      module Types
        class UpdateOrderTestSimulationRequest < Internal::Types::Model
          field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

          field :mode, -> { Affinity::Orders::TestSimulation::Types::UpdateOrderTestSimulationRequestMode }, optional: false, nullable: false

          field :scenario, -> { Affinity::Orders::TestSimulation::Types::UpdateOrderTestSimulationRequestScenario }, optional: false, nullable: false

          field :action, -> { Affinity::Orders::TestSimulation::Types::UpdateOrderTestSimulationRequestAction }, optional: true, nullable: false
        end
      end
    end
  end
end
