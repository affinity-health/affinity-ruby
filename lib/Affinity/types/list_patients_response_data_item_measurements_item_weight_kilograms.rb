# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItemMeasurementsItemWeightKilograms < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListPatientsResponseDataItemMeasurementsItemWeightKilogramsOne }
    end
  end
end
