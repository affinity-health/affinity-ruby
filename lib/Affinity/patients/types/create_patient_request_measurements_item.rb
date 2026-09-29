# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequestMeasurementsItem < Internal::Types::Model
        field :height_centimeters, -> { Affinity::Patients::Types::CreatePatientRequestMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

        field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

        field :source, -> { String }, optional: false, nullable: false

        field :weight_kilograms, -> { Affinity::Patients::Types::CreatePatientRequestMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
      end
    end
  end
end
