# frozen_string_literal: true

module Affinity
  module Team
    module Types
      module RegisterUserRequestRole
        extend Affinity::Internal::Types::Enum

        ADMINISTRATOR = "administrator"
        PRESCRIBER = "prescriber"
        CLINICAL_STAFF = "clinical_staff"
        BILLING = "billing"
        DEVELOPER = "developer"
      end
    end
  end
end
