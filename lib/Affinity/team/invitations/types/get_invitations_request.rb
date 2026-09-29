# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class GetInvitationsRequest < Internal::Types::Model
          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :invitation_id, -> { String }, optional: false, nullable: false, api_name: "invitationId"
        end
      end
    end
  end
end
