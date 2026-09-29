# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamMemberResponseAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::GetPracticeTeamMemberResponseAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
