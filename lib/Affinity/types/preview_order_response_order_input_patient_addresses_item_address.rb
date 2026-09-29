# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatientAddressesItemAddress < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: false

      field :country, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientAddressesItemAddressCountry }, optional: true, nullable: false

      field :line1, -> { String }, optional: false, nullable: false

      field :line2, -> { String }, optional: true, nullable: false

      field :postal_code, -> { String }, optional: false, nullable: false, api_name: "postalCode"

      field :state, -> { String }, optional: false, nullable: false
    end
  end
end
