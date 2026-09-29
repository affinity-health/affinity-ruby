# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class GetTeamRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"
      end
    end
  end
end
