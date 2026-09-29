# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class RegisterUserRequestProfileDetailsAddressesItem < Internal::Types::Model
        field :purpose, -> { String }, optional: false, nullable: false

        field :line1, -> { String }, optional: false, nullable: false

        field :line2, -> { String }, optional: false, nullable: false

        field :city, -> { String }, optional: false, nullable: false

        field :state, -> { String }, optional: false, nullable: false

        field :postal_code, -> { String }, optional: false, nullable: false, api_name: "postalCode"

        field :country, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: false, nullable: false

        field :fax, -> { String }, optional: false, nullable: false
      end
    end
  end
end
