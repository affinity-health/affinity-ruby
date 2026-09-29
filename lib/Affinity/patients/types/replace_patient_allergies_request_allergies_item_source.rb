# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      module ReplacePatientAllergiesRequestAllergiesItemSource
        extend Affinity::Internal::Types::Enum

        DOCTOR = "Doctor"
        PATIENT = "Patient"
        PATIENT_AGENT_GUARDIAN = "Patient Agent/Guardian"
        PHARMACIST = "Pharmacist"
      end
    end
  end
end
