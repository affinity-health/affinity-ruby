# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestMeasurementsItemHeightCentimeters < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::UpdatePatientRequestMeasurementsItemHeightCentimetersOne }
      end
    end
  end
end
