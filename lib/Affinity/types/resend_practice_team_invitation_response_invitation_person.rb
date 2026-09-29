# frozen_string_literal: true

module Affinity
  module Types
    class ResendPracticeTeamInvitationResponseInvitationPerson < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ResendPracticeTeamInvitationResponseInvitationPersonObject }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :email, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: true

      field :status, -> { String }, optional: false, nullable: false

      field :invitation, -> { Affinity::Types::ResendPracticeTeamInvitationResponseInvitationPersonInvitation }, optional: false, nullable: true

      field :account, -> { Affinity::Types::ResendPracticeTeamInvitationResponseInvitationPersonAccount }, optional: false, nullable: true

      field :next_actions, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "nextActions"
    end
  end
end
