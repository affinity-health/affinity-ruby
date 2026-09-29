# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponseClinicalProfile < Internal::Types::Model
      field :current_medications, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "currentMedications"

      field :height_inches, -> { Affinity::Types::CreatePatientResponseClinicalProfileHeightInches }, optional: false, nullable: true, api_name: "heightInches"

      field :reviewed_at, -> { String }, optional: false, nullable: true, api_name: "reviewedAt"

      field :weight_pounds, -> { Affinity::Types::CreatePatientResponseClinicalProfileWeightPounds }, optional: false, nullable: true, api_name: "weightPounds"
    end
  end
end
