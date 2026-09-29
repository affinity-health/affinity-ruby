# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamInvitationResponsePersonAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false, api_name: "accountId"

      field :email_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "emailVerified"

      field :membership_id, -> { String }, optional: false, nullable: false, api_name: "membershipId"

      field :membership_status, -> { String }, optional: false, nullable: false, api_name: "membershipStatus"

      field :roles, -> { Internal::Types::Array[Affinity::Types::GetPracticeTeamInvitationResponsePersonAccountRolesItem] }, optional: false, nullable: false

      field :prescriber_connection, -> { Affinity::Types::GetPracticeTeamInvitationResponsePersonAccountPrescriberConnection }, optional: false, nullable: true, api_name: "prescriberConnection"
    end
  end
end
