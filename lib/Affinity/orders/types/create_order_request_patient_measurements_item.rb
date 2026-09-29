# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequestPatientMeasurementsItem < Internal::Types::Model
        field :height_centimeters, -> { Affinity::Orders::Types::CreateOrderRequestPatientMeasurementsItemHeightCentimeters }, optional: false, nullable: true, api_name: "heightCentimeters"

        field :recorded_at, -> { String }, optional: false, nullable: false, api_name: "recordedAt"

        field :source, -> { String }, optional: false, nullable: false

        field :weight_kilograms, -> { Affinity::Orders::Types::CreateOrderRequestPatientMeasurementsItemWeightKilograms }, optional: false, nullable: true, api_name: "weightKilograms"
      end
    end
  end
end
