# frozen_string_literal: true

module Affinity
  module Types
    class GetPatientResponseMeasurementsItemWeightKilograms < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetPatientResponseMeasurementsItemWeightKilogramsOne }
    end
  end
end
