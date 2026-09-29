# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class RevokePracticeTeamInvitationRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :invitation_id, -> { String }, optional: false, nullable: false, api_name: "invitationId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
      end
    end
  end
end
