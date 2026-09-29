# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePracticeTeamLicenseResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :state, -> { String }, optional: false, nullable: false

      field :license_number, -> { String }, optional: false, nullable: false, api_name: "licenseNumber"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"
    end
  end
end
