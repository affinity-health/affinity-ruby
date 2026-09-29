# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamInvitationResponsePersonAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::GetPracticeTeamInvitationResponsePersonAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
