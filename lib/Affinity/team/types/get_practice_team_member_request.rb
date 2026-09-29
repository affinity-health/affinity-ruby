# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class GetPracticeTeamMemberRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :member_id, -> { String }, optional: false, nullable: false, api_name: "memberId"
      end
    end
  end
end
