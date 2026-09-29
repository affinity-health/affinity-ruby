# frozen_string_literal: true

module Affinity
  module Locations
    module Types
      class ArchiveLocationsRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :location_id, -> { String }, optional: false, nullable: false, api_name: "locationId"

        field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"
      end
    end
  end
end
