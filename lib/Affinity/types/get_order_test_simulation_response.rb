# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderTestSimulationResponse < Internal::Types::Model
      field :mode, -> { Affinity::Types::GetOrderTestSimulationResponseMode }, optional: false, nullable: false

      field :scenario, -> { Affinity::Types::GetOrderTestSimulationResponseScenario }, optional: false, nullable: false

      field :pending_action, -> { String }, optional: false, nullable: true, api_name: "pendingAction"

      field :last_error, -> { String }, optional: false, nullable: true, api_name: "lastError"

      field :available_actions, -> { Internal::Types::Array[Affinity::Types::GetOrderTestSimulationResponseAvailableActionsItem] }, optional: false, nullable: false, api_name: "availableActions"

      field :scenario_editable, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "scenarioEditable"
    end
  end
end
