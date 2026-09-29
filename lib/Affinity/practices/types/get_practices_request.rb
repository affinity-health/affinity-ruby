# frozen_string_literal: true

module Affinity
  module Practices
    module Types
      class GetPracticesRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"
      end
    end
  end
end
