# frozen_string_literal: true

module Affinity
  module Types
    class ListPharmaciesResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPharmaciesResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListPharmaciesResponseObject }, optional: false, nullable: false

      field :url, -> { Affinity::Types::ListPharmaciesResponseURL }, optional: false, nullable: false
    end
  end
end
