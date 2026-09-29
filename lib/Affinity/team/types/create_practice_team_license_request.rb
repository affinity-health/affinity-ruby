# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class CreatePracticeTeamLicenseRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :prescriber_id, -> { String }, optional: false, nullable: false, api_name: "prescriberId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :state, -> { String }, optional: false, nullable: false

        field :license_number, -> { String }, optional: false, nullable: false, api_name: "licenseNumber"

        field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
      end
    end
  end
end
