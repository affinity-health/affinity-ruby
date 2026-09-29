# frozen_string_literal: true

module Affinity
  module Types
    class ResendPracticeTeamInvitationResponseInvitationPersonInvitationRolesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: true
    end
  end
end
