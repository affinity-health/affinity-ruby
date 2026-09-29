# frozen_string_literal: true

module Affinity
  module Types
    class ListPharmaciesResponseDataItemFacilityLocationsItem < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: false

      field :state, -> { String }, optional: false, nullable: true
    end
  end
end
