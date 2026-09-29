# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseMeasurementsItemWeightKilograms < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::UpdatePatientResponseMeasurementsItemWeightKilogramsOne }
    end
  end
end
