# frozen_string_literal: true

module Affinity
  module Types
    class ListPharmaciesResponseDataItemProfile < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false

      field :effective_at, -> { String }, optional: false, nullable: false, api_name: "effectiveAt"

      field :monthly_prescription_volume, -> { Integer }, optional: false, nullable: true, api_name: "monthlyPrescriptionVolume"

      field :rating, -> { Affinity::Types::ListPharmaciesResponseDataItemProfileRating }, optional: false, nullable: true

      field :rating_basis, -> { String }, optional: false, nullable: true, api_name: "ratingBasis"

      field :rating_review_count, -> { Integer }, optional: false, nullable: true, api_name: "ratingReviewCount"

      field :recommended_rank, -> { Integer }, optional: false, nullable: true, api_name: "recommendedRank"
    end
  end
end
