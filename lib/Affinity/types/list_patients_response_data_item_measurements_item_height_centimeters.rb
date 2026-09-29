# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItemMeasurementsItemHeightCentimeters < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListPatientsResponseDataItemMeasurementsItemHeightCentimetersOne }
    end
  end
end
