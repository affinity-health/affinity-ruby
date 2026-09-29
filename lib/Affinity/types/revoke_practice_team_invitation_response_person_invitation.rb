# frozen_string_literal: true

module Affinity
  module Types
    class RevokePracticeTeamInvitationResponsePersonInvitation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { Affinity::Types::RevokePracticeTeamInvitationResponsePersonInvitationStatus }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"

      field :roles, -> { Internal::Types::Array[Affinity::Types::RevokePracticeTeamInvitationResponsePersonInvitationRolesItem] }, optional: false, nullable: false
    end
  end
end
