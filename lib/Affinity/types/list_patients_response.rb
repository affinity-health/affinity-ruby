# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListPatientsResponseObject }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
