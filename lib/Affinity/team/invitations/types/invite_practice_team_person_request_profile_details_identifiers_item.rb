# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class InvitePracticeTeamPersonRequestProfileDetailsIdentifiersItem < Internal::Types::Model
          field :identifier, -> { String }, optional: false, nullable: false

          field :issuer, -> { String }, optional: false, nullable: false

          field :state, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
