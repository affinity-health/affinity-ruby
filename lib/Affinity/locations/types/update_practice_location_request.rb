# frozen_string_literal: true

module Affinity
  module Locations
    module Types
      class UpdatePracticeLocationRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :location_id, -> { String }, optional: false, nullable: false, api_name: "locationId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :city, -> { String }, optional: true, nullable: false

        field :country, -> { String }, optional: true, nullable: false

        field :line1, -> { String }, optional: true, nullable: false

        field :line2, -> { String }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :postal_code, -> { String }, optional: true, nullable: false, api_name: "postalCode"

        field :state, -> { String }, optional: true, nullable: false

        field :timezone, -> { String }, optional: true, nullable: false
      end
    end
  end
end
