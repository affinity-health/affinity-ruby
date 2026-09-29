# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponseMembersActive < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetPracticeTeamResponseMembersActiveOne }
    end
  end
end
