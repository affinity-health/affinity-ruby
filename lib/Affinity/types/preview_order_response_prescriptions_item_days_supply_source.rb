# frozen_string_literal: true

module Affinity
  module Types
    module PreviewOrderResponsePrescriptionsItemDaysSupplySource
      extend Affinity::Internal::Types::Enum

      MANUAL = "manual"
      CALCULATED = "calculated"
      PRESET = "preset"
      MISSING = "missing"
    end
  end
end
