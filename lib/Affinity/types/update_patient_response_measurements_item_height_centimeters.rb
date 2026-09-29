# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseMeasurementsItemHeightCentimeters < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::UpdatePatientResponseMeasurementsItemHeightCentimetersOne }
    end
  end
end
