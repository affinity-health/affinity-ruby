# frozen_string_literal: true

module Affinity
  module Team
    module Prescribers
      module Licenses
        module Types
          class UpdatePracticeTeamLicenseRequest < Internal::Types::Model
            field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

            field :prescriber_id, -> { String }, optional: false, nullable: false, api_name: "prescriberId"

            field :license_id, -> { String }, optional: false, nullable: false, api_name: "licenseId"

            field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

            field :state, -> { String }, optional: true, nullable: false

            field :license_number, -> { String }, optional: true, nullable: false, api_name: "licenseNumber"

            field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
          end
        end
      end
    end
  end
end
