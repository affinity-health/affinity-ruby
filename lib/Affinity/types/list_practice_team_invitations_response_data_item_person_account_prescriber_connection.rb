# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticeTeamInvitationsResponseDataItemPersonAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::ListPracticeTeamInvitationsResponseDataItemPersonAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
