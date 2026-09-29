# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestMeasurementsItemWeightKilograms < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::UpdatePatientRequestMeasurementsItemWeightKilogramsOne }
      end
    end
  end
end
