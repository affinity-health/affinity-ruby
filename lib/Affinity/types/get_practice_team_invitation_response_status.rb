# frozen_string_literal: true

module Affinity
  module Types
    module GetPracticeTeamInvitationResponseStatus
      extend Affinity::Internal::Types::Enum

      ACCEPTED = "accepted"
      DECLINED = "declined"
      PENDING = "pending"
      EXPIRED = "expired"
      REVOKED = "revoked"
    end
  end
end
