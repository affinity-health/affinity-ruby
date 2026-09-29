# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponseMembers < Internal::Types::Model
      field :total, -> { Affinity::Types::GetPracticeTeamResponseMembersTotal }, optional: false, nullable: false

      field :active, -> { Affinity::Types::GetPracticeTeamResponseMembersActive }, optional: false, nullable: false

      field :disabled, -> { Affinity::Types::GetPracticeTeamResponseMembersDisabled }, optional: false, nullable: false
    end
  end
end
