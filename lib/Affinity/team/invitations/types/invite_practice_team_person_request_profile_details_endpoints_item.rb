# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class InvitePracticeTeamPersonRequestProfileDetailsEndpointsItem < Internal::Types::Model
          field :endpoint, -> { String }, optional: false, nullable: false

          field :type, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: false, nullable: false

          field :use, -> { String }, optional: false, nullable: false

          field :affiliation, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
