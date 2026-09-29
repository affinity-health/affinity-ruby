# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class RegisterUserRequestProfileDetails < Internal::Types::Model
        field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"

        field :middle_name, -> { String }, optional: true, nullable: false, api_name: "middleName"

        field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"

        field :name_prefix, -> { String }, optional: true, nullable: false, api_name: "namePrefix"

        field :name_suffix, -> { String }, optional: true, nullable: false, api_name: "nameSuffix"

        field :fax, -> { String }, optional: true, nullable: false

        field :specialties, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestProfileDetailsSpecialtiesItem] }, optional: true, nullable: false

        field :addresses, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestProfileDetailsAddressesItem] }, optional: true, nullable: false

        field :other_names, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestProfileDetailsOtherNamesItem] }, optional: true, nullable: false, api_name: "otherNames"

        field :identifiers, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestProfileDetailsIdentifiersItem] }, optional: true, nullable: false

        field :endpoints, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestProfileDetailsEndpointsItem] }, optional: true, nullable: false

        field :certifications, -> { Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestProfileDetailsCertificationsItem] }, optional: true, nullable: false
      end
    end
  end
end
