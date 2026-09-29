# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponseMeasurementsItem < Internal::Types::Model
      field :height_centimeters, -> { Affinity::Types::CreatePatientResponseMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

      field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

      field :source, -> { String }, optional: false, nullable: false

      field :weight_kilograms, -> { Affinity::Types::CreatePatientResponseMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
    end
  end
end
