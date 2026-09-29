# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListOrdersResponseObject }, optional: false, nullable: false

      field :url, -> { Affinity::Types::ListOrdersResponseURL }, optional: false, nullable: false
    end
  end
end
