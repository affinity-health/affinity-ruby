# frozen_string_literal: true

module Affinity
  module Types
    class ResendPracticeTeamInvitationResponseInvitationPersonAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::ResendPracticeTeamInvitationResponseInvitationPersonAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
