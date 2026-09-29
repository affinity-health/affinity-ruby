# frozen_string_literal: true

module Affinity
  module Types
    class GetPatientAllergiesResponse < Internal::Types::Model
      field :allergies, -> { Internal::Types::Array[Affinity::Types::GetPatientAllergiesResponseAllergiesItem] }, optional: false, nullable: false

      field :review_status, -> { Affinity::Types::GetPatientAllergiesResponseReviewStatus }, optional: false, nullable: false, api_name: "reviewStatus"
    end
  end
end
