# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        module InvitePracticeTeamPersonRequestRole
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
end
