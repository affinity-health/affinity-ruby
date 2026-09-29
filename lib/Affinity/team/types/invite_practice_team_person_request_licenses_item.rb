# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class InvitePracticeTeamPersonRequestLicensesItem < Internal::Types::Model
        field :state, -> { String }, optional: false, nullable: false

        field :license_number, -> { String }, optional: false, nullable: false, api_name: "licenseNumber"

        field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
      end
    end
  end
end
