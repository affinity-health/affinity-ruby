# frozen_string_literal: true

module Affinity
  module Orders
    module TestSimulation
      module Types
        class GetTestSimulationRequest < Internal::Types::Model
          field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"
        end
      end
    end
  end
end
