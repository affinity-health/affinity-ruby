# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePracticeTeamMemberResponseAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::UpdatePracticeTeamMemberResponseAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
