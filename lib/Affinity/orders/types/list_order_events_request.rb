# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class ListOrderEventsRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"
      end
    end
  end
end
