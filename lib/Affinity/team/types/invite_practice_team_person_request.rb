# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class InvitePracticeTeamPersonRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :email, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :role, -> { Affinity::Team::Types::InvitePracticeTeamPersonRequestRole }, optional: true, nullable: false

        field :roles, -> { Internal::Types::Array[Affinity::Team::Types::InvitePracticeTeamPersonRequestRolesItem] }, optional: true, nullable: false

        field :profile_details, -> { Affinity::Team::Types::InvitePracticeTeamPersonRequestProfileDetails }, optional: true, nullable: false, api_name: "profileDetails"

        field :npi, -> { String }, optional: true, nullable: false

        field :licenses, -> { Internal::Types::Array[Affinity::Team::Types::InvitePracticeTeamPersonRequestLicensesItem] }, optional: true, nullable: false

        field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

        field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

        field :credentials, -> { String }, optional: true, nullable: false

        field :address, -> { Affinity::Team::Types::InvitePracticeTeamPersonRequestAddress }, optional: true, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "locationIds"
      end
    end
  end
end
