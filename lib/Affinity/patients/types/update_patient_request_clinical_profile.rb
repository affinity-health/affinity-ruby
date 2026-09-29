# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestClinicalProfile < Internal::Types::Model
        field :current_medications, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "currentMedications"

        field :height_inches, -> { Affinity::Patients::Types::UpdatePatientRequestClinicalProfileHeightInches }, optional: true, nullable: false, api_name: "heightInches"

        field :reviewed_at, -> { String }, optional: true, nullable: false, api_name: "reviewedAt"

        field :weight_pounds, -> { Affinity::Patients::Types::UpdatePatientRequestClinicalProfileWeightPounds }, optional: true, nullable: false, api_name: "weightPounds"
      end
    end
  end
end
