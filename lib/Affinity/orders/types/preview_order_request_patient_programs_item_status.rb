# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module PreviewOrderRequestPatientProgramsItemStatus
        extend Affinity::Internal::Types::Enum

        ACTIVE = "active"
        COMPLETED = "completed"
        PAUSED = "paused"
      end
    end
  end
end
