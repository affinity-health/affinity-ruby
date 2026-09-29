# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatientClinicalProfileWeightPounds < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::PreviewOrderResponseOrderInputPatientClinicalProfileWeightPoundsOne }
    end
  end
end
