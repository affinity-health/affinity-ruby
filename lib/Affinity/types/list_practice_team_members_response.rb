# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticeTeamMembersResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPracticeTeamMembersResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListPracticeTeamMembersResponseObject }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
