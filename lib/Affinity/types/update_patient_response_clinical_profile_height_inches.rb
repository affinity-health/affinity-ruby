# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseClinicalProfileHeightInches < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::UpdatePatientResponseClinicalProfileHeightInchesOne }
    end
  end
end
