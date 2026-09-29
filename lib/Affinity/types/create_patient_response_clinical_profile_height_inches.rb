# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponseClinicalProfileHeightInches < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::CreatePatientResponseClinicalProfileHeightInchesOne }
    end
  end
end
