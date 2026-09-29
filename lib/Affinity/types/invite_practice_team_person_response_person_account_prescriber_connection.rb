# frozen_string_literal: true

module Affinity
  module Types
    class InvitePracticeTeamPersonResponsePersonAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::InvitePracticeTeamPersonResponsePersonAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
