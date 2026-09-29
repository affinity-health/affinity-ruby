# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class RegisterUserRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

        field :email, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :role, -> { Affinity::Team::Types::RegisterUserRequestRole }, optional: false, nullable: false

        field :roles, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestRolesItem] }, optional: true, nullable: false

        field :profile_details, -> { Affinity::Team::Types::RegisterUserRequestProfileDetails }, optional: true, nullable: false, api_name: "profileDetails"

        field :npi, -> { String }, optional: true, nullable: false

        field :licenses, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestLicensesItem] }, optional: true, nullable: false

        field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

        field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

        field :credentials, -> { String }, optional: true, nullable: false

        field :address, -> { Affinity::Team::Types::RegisterUserRequestAddress }, optional: true, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "locationIds"

        field :identity_attestation, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "identityAttestation"
      end
    end
  end
end
