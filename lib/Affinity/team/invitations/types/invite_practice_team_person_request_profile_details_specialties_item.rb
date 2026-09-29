# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class InvitePracticeTeamPersonRequestProfileDetailsSpecialtiesItem < Internal::Types::Model
          field :code, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: false, nullable: false

          field :primary, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
