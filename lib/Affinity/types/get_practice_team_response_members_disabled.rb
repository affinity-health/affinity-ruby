# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponseMembersDisabled < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetPracticeTeamResponseMembersDisabledOne }
    end
  end
end
