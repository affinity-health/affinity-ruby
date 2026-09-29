# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticesResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPracticesResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListPracticesResponseObject }, optional: false, nullable: false

      field :url, -> { Affinity::Types::ListPracticesResponseURL }, optional: false, nullable: false
    end
  end
end
