# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      module CreatePatientRequestProgramsItemStatus
        extend Affinity::Internal::Types::Enum

        ACTIVE = "active"
        COMPLETED = "completed"
        PAUSED = "paused"
      end
    end
  end
end
