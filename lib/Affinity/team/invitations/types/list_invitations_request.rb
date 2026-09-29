# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class ListInvitationsRequest < Internal::Types::Model
          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

          field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

          field :status, -> { Affinity::Team::Invitations::Types::ListInvitationsRequestStatus }, optional: true, nullable: false

          field :email, -> { String }, optional: true, nullable: false

          field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"
        end
      end
    end
  end
end
