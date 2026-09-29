# frozen_string_literal: true

module Affinity
  module Types
    class ResendPracticeTeamInvitationResponse < Internal::Types::Model
      field :invitation, -> { Affinity::Types::ResendPracticeTeamInvitationResponseInvitation }, optional: false, nullable: false

      field :delivery, -> { Affinity::Types::ResendPracticeTeamInvitationResponseDelivery }, optional: false, nullable: false
    end
  end
end
