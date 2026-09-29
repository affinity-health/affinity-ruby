# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponseClinicalProfileWeightPounds < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::CreatePatientResponseClinicalProfileWeightPoundsOne }
    end
  end
end
