# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponsePrescribers < Internal::Types::Model
      field :total, -> { Affinity::Types::GetPracticeTeamResponsePrescribersTotal }, optional: false, nullable: false

      field :active, -> { Affinity::Types::GetPracticeTeamResponsePrescribersActive }, optional: false, nullable: false
    end
  end
end
