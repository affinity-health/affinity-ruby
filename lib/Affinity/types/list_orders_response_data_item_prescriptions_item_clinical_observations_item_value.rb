# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemPrescriptionsItemClinicalObservationsItemValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalObservationsItemValueOne }
    end
  end
end
