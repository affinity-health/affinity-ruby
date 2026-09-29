# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequestMeasurementsItemWeightKilograms < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::CreatePatientRequestMeasurementsItemWeightKilogramsOne }
      end
    end
  end
end
