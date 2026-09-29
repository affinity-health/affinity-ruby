# frozen_string_literal: true

module Affinity
  module Types
    class InvitePracticeTeamPersonResponsePersonInvitation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { Affinity::Types::InvitePracticeTeamPersonResponsePersonInvitationStatus }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"

      field :roles, -> { Internal::Types::Array[Affinity::Types::InvitePracticeTeamPersonResponsePersonInvitationRolesItem] }, optional: false, nullable: false
    end
  end
end
