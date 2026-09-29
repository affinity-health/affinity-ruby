# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticeTeamMembersResponseDataItemAccountPrescriberConnection < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :provider, -> { Affinity::Types::ListPracticeTeamMembersResponseDataItemAccountPrescriberConnectionProvider }, optional: false, nullable: false
    end
  end
end
