# frozen_string_literal: true

module Affinity
  module Types
    module GetPatientAllergiesResponseAllergiesItemSource
      extend Affinity::Internal::Types::Enum

      DOCTOR = "Doctor"
      PATIENT = "Patient"
      PATIENT_AGENT_GUARDIAN = "Patient Agent/Guardian"
      PHARMACIST = "Pharmacist"
    end
  end
end
