# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamInvitationResponsePersonInvitation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { Affinity::Types::GetPracticeTeamInvitationResponsePersonInvitationStatus }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"

      field :roles, -> { Internal::Types::Array[Affinity::Types::GetPracticeTeamInvitationResponsePersonInvitationRolesItem] }, optional: false, nullable: false
    end
  end
end
