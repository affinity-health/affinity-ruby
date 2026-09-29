# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestClinicalProfileWeightPounds < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Integer }

        member -> { Affinity::Patients::Types::UpdatePatientRequestClinicalProfileWeightPoundsOne }
      end
    end
  end
end
