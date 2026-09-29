# frozen_string_literal: true

module Affinity
  module Team
    module Types
      module InvitePracticeTeamPersonRequestRolesItem
        extend Affinity::Internal::Types::Enum

        OWNER = "owner"
        ADMINISTRATOR = "administrator"
        PRESCRIBER = "prescriber"
        CLINICAL_STAFF = "clinical_staff"
        BILLING = "billing"
        DEVELOPER = "developer"
      end
    end
  end
end
