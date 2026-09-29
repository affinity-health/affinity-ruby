# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticeTeamInvitationsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPracticeTeamInvitationsResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListPracticeTeamInvitationsResponseObject }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
