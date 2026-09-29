# frozen_string_literal: true

module Affinity
  module Locations
    module Types
      class GetLocationsRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :location_id, -> { String }, optional: false, nullable: false, api_name: "locationId"
      end
    end
  end
end
