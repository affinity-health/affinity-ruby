# frozen_string_literal: true

module Affinity
  module Types
    class ReplacePatientAllergiesResponse < Internal::Types::Model
      field :allergies, -> { Internal::Types::Array[Affinity::Types::ReplacePatientAllergiesResponseAllergiesItem] }, optional: false, nullable: false

      field :review_status, -> { Affinity::Types::ReplacePatientAllergiesResponseReviewStatus }, optional: false, nullable: false, api_name: "reviewStatus"
    end
  end
end
