# frozen_string_literal: true

module Affinity
  module Locations
    module Types
      class ListLocationsRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :status, -> { Affinity::Locations::Types::ListLocationsRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
