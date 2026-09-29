# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItemClinicalProfileHeightInches < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListPatientsResponseDataItemClinicalProfileHeightInchesOne }
    end
  end
end
