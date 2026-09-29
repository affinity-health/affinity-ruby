# frozen_string_literal: true

module Affinity
  module Types
    class GetPatientResponseMeasurementsItemHeightCentimeters < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetPatientResponseMeasurementsItemHeightCentimetersOne }
    end
  end
end
