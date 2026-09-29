# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class ListPatientAddressesRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

        field :status, -> { Affinity::Patients::Types::ListPatientAddressesRequestStatus }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"
      end
    end
  end
end
