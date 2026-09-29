# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatientClinicalProfileHeightInches < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::PreviewOrderResponseOrderInputPatientClinicalProfileHeightInchesOne }
    end
  end
end
