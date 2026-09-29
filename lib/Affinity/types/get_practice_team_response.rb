# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::GetPracticeTeamResponseObject }, optional: false, nullable: false

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :members, -> { Affinity::Types::GetPracticeTeamResponseMembers }, optional: false, nullable: false

      field :invitations, -> { Affinity::Types::GetPracticeTeamResponseInvitations }, optional: false, nullable: false

      field :prescribers, -> { Affinity::Types::GetPracticeTeamResponsePrescribers }, optional: false, nullable: false
    end
  end
end
