# frozen_string_literal: true

module Affinity
  module Types
    class ListPharmaciesResponseDataItemProfileRating < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::ListPharmaciesResponseDataItemProfileRatingOne }
    end
  end
end
