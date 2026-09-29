# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class ReplacePatientAllergiesRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

        field :allergies, -> { Internal::Types::Array[Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItem] }, optional: false, nullable: false

        field :review_status, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestReviewStatus }, optional: false, nullable: false, api_name: "reviewStatus"
      end
    end
  end
end
