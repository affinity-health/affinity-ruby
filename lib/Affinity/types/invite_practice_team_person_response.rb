# frozen_string_literal: true

module Affinity
  module Types
    class InvitePracticeTeamPersonResponse < Internal::Types::Model
      field :person, -> { Affinity::Types::InvitePracticeTeamPersonResponsePerson }, optional: false, nullable: false

      field :delivery, -> { Affinity::Types::InvitePracticeTeamPersonResponseDelivery }, optional: false, nullable: false
    end
  end
end
