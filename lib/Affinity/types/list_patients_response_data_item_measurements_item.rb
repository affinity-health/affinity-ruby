# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItemMeasurementsItem < Internal::Types::Model
      field :height_centimeters, -> { Affinity::Types::ListPatientsResponseDataItemMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

      field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

      field :source, -> { String }, optional: false, nullable: false

      field :weight_kilograms, -> { Affinity::Types::ListPatientsResponseDataItemMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
    end
  end
end
