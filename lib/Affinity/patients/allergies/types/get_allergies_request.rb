# frozen_string_literal: true

module Affinity
  module Patients
    module Allergies
      module Types
        class GetAllergiesRequest < Internal::Types::Model
          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

          field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

          field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"
        end
      end
    end
  end
end
