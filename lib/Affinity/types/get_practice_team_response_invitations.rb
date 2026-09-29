# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponseInvitations < Internal::Types::Model
      field :pending, -> { Affinity::Types::GetPracticeTeamResponseInvitationsPending }, optional: false, nullable: false

      field :expired, -> { Affinity::Types::GetPracticeTeamResponseInvitationsExpired }, optional: false, nullable: false
    end
  end
end
