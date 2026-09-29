# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseMeasurementsItem < Internal::Types::Model
      field :height_centimeters, -> { Affinity::Types::UpdatePatientResponseMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

      field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

      field :source, -> { String }, optional: false, nullable: false

      field :weight_kilograms, -> { Affinity::Types::UpdatePatientResponseMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
    end
  end
end
