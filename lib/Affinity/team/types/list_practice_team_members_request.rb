# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class ListPracticeTeamMembersRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :search, -> { String }, optional: true, nullable: false

        field :role, -> { Affinity::Team::Types::ListPracticeTeamMembersRequestRole }, optional: true, nullable: false

        field :status, -> { Affinity::Team::Types::ListPracticeTeamMembersRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
