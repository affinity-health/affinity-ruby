# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class ListPatientsRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :external_identity_source, -> { String }, optional: true, nullable: false, api_name: "externalIdentitySource"

        field :external_identity_value, -> { String }, optional: true, nullable: false, api_name: "externalIdentityValue"

        field :gender, -> { Affinity::Patients::Types::ListPatientsRequestGender }, optional: true, nullable: false

        field :last_order_after, -> { String }, optional: true, nullable: false, api_name: "lastOrderAfter"

        field :last_order_before, -> { String }, optional: true, nullable: false, api_name: "lastOrderBefore"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :program, -> { String }, optional: true, nullable: false

        field :query, -> { String }, optional: true, nullable: false

        field :sort, -> { Affinity::Patients::Types::ListPatientsRequestSort }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :states, -> { String }, optional: true, nullable: false

        field :status, -> { Affinity::Patients::Types::ListPatientsRequestStatus }, optional: true, nullable: false

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"
      end
    end
  end
end
