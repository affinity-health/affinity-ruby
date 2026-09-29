# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponseMeasurementsItemHeightCentimeters < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::CreatePatientResponseMeasurementsItemHeightCentimetersOne }
    end
  end
end
