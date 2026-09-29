# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class GetPracticeTeamPrescriberRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :prescriber_id, -> { String }, optional: false, nullable: false, api_name: "prescriberId"
      end
    end
  end
end
