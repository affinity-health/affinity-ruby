# frozen_string_literal: true

module Affinity
  module Team
    module Members
      module Types
        class ListMembersRequest < Internal::Types::Model
          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

          field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

          field :search, -> { String }, optional: true, nullable: false

          field :role, -> { Affinity::Team::Members::Types::ListMembersRequestRole }, optional: true, nullable: false

          field :status, -> { Affinity::Team::Members::Types::ListMembersRequestStatus }, optional: true, nullable: false
        end
      end
    end
  end
end
