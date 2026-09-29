# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticeLocationsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPracticeLocationsResponseDataItem] }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListPracticeLocationsResponseObject }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
