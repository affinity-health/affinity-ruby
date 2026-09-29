# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class InvitePracticeTeamPersonRequestProfileDetailsOtherNamesItem < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :credentials, -> { String }, optional: false, nullable: false

          field :type, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
