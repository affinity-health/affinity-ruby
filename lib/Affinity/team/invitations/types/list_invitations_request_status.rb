# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        module ListInvitationsRequestStatus
          extend Affinity::Internal::Types::Enum

          ACCEPTED = "accepted"
          DECLINED = "declined"
          PENDING = "pending"
          EXPIRED = "expired"
          REVOKED = "revoked"
        end
      end
    end
  end
end
