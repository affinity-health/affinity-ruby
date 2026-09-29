# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamInvitationResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::GetPracticeTeamInvitationResponseObject }, optional: false, nullable: false

      field :email, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :status, -> { Affinity::Types::GetPracticeTeamInvitationResponseStatus }, optional: false, nullable: false

      field :roles, -> { Internal::Types::Array[Affinity::Types::GetPracticeTeamInvitationResponseRolesItem] }, optional: false, nullable: false

      field :location_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "locationIds"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"

      field :accepted_at, -> { String }, optional: false, nullable: true, api_name: "acceptedAt"

      field :user_id, -> { String }, optional: false, nullable: true, api_name: "userId"

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :member_id, -> { String }, optional: false, nullable: true, api_name: "memberId"

      field :prescriber_id, -> { String }, optional: false, nullable: true, api_name: "prescriberId"

      field :person, -> { Affinity::Types::GetPracticeTeamInvitationResponsePerson }, optional: false, nullable: true
    end
  end
end
