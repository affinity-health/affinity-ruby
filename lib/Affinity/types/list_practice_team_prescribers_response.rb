# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticeTeamPrescribersResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPracticeTeamPrescribersResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListPracticeTeamPrescribersResponseObject }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
