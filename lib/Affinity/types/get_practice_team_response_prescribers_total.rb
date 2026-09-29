# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamResponsePrescribersTotal < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::GetPracticeTeamResponsePrescribersTotalOne }
    end
  end
end
