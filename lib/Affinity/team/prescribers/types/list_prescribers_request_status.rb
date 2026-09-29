# frozen_string_literal: true

module Affinity
  module Team
    module Prescribers
      module Types
        module ListPrescribersRequestStatus
          extend Affinity::Internal::Types::Enum

          ACTIVE = "active"
          INACTIVE = "inactive"
        end
      end
    end
  end
end
