# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseClinicalProfileWeightPounds < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::UpdatePatientResponseClinicalProfileWeightPoundsOne }
    end
  end
end
