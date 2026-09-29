# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestMeasurementsItem < Internal::Types::Model
        field :height_centimeters, -> { Affinity::Patients::Types::UpdatePatientRequestMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

        field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

        field :source, -> { String }, optional: false, nullable: false

        field :weight_kilograms, -> { Affinity::Patients::Types::UpdatePatientRequestMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
      end
    end
  end
end
