# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class InvitePracticeTeamPersonRequestProfileDetailsCertificationsItem < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :issuer, -> { String }, optional: false, nullable: false

          field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"
        end
      end
    end
  end
end
