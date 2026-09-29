# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequestClinicalProfileHeightInches < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::CreatePatientRequestClinicalProfileHeightInchesOne }
      end
    end
  end
end
