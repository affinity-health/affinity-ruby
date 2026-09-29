# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequestClinicalProfileWeightPounds < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::CreatePatientRequestClinicalProfileWeightPoundsOne }
      end
    end
  end
end
