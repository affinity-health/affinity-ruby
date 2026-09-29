# frozen_string_literal: true

module Affinity
  module Types
    class RevokePracticeTeamInvitationResponsePersonAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::RevokePracticeTeamInvitationResponsePersonAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
