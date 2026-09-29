# frozen_string_literal: true

module Affinity
  module Practices
    module Types
      class ListPracticesRequest < Internal::Types::Model
        field :search, -> { String }, optional: true, nullable: false

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

        field :limit, -> { Integer }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"
      end
    end
  end
end
