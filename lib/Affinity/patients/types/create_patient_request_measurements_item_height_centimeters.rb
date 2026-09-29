# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequestMeasurementsItemHeightCentimeters < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::CreatePatientRequestMeasurementsItemHeightCentimetersOne }
      end
    end
  end
end
