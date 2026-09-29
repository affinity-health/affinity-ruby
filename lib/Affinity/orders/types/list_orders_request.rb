# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class ListOrdersRequest < Internal::Types::Model
        field :query, -> { String }, optional: true, nullable: false

        field :external_order_id, -> { String }, optional: true, nullable: false, api_name: "externalOrderId"

        field :created_after, -> { String }, optional: true, nullable: false, api_name: "createdAfter"

        field :created_before, -> { String }, optional: true, nullable: false, api_name: "createdBefore"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"

        field :patient_id, -> { String }, optional: true, nullable: false, api_name: "patientId"

        field :patient_external_id, -> { String }, optional: true, nullable: false, api_name: "patientExternalId"

        field :practice_id, -> { String }, optional: true, nullable: false, api_name: "practiceId"

        field :sort, -> { Affinity::Orders::Types::ListOrdersRequestSort }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :status, -> { Affinity::Orders::Types::ListOrdersRequestStatus }, optional: true, nullable: false

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"
      end
    end
  end
end
