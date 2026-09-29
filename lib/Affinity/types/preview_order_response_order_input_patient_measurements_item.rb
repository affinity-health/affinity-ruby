# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatientMeasurementsItem < Internal::Types::Model
      field :height_centimeters, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

      field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

      field :source, -> { String }, optional: false, nullable: false

      field :weight_kilograms, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
    end
  end
end
