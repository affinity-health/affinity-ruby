# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestAddress < Internal::Types::Model
        field :city, -> { String }, optional: false, nullable: false

        field :line1, -> { String }, optional: false, nullable: false

        field :line2, -> { String }, optional: true, nullable: false

        field :postal_code, -> { String }, optional: false, nullable: false, api_name: "postalCode"

        field :state, -> { String }, optional: false, nullable: false

        field :country, -> { Affinity::Patients::Types::UpdatePatientRequestAddressCountry }, optional: true, nullable: false
      end
    end
  end
end
