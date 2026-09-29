# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPatientClinicalProfile < Internal::Types::Model
        field :current_medications, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "currentMedications"

        field :height_inches, -> { Affinity::Orders::Types::PreviewOrderRequestPatientClinicalProfileHeightInches }, optional: true, nullable: false, api_name: "heightInches"

        field :reviewed_at, -> { String }, optional: true, nullable: false, api_name: "reviewedAt"

        field :weight_pounds, -> { Affinity::Orders::Types::PreviewOrderRequestPatientClinicalProfileWeightPounds }, optional: true, nullable: false, api_name: "weightPounds"
      end
    end
  end
end
