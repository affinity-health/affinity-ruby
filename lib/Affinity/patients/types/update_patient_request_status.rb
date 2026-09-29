# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      module UpdatePatientRequestStatus
        extend Affinity::Internal::Types::Enum

        ACTIVE = "active"
        INACTIVE = "inactive"
      end
    end
  end
end
