# frozen_string_literal: true

module Affinity
  module Team
    module Invitations
      module Types
        class InvitePracticeTeamPersonRequestProfileDetails < Internal::Types::Model
          field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"

          field :middle_name, -> { String }, optional: true, nullable: false, api_name: "middleName"

          field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"

          field :name_prefix, -> { String }, optional: true, nullable: false, api_name: "namePrefix"

          field :name_suffix, -> { String }, optional: true, nullable: false, api_name: "nameSuffix"

          field :fax, -> { String }, optional: true, nullable: false

          field :specialties, -> { Internal::Types::Array[Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequestProfileDetailsSpecialtiesItem] }, optional: true, nullable: false

          field :addresses, -> { Internal::Types::Array[Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequestProfileDetailsAddressesItem] }, optional: true, nullable: false

          field :other_names, -> { Internal::Types::Array[Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequestProfileDetailsOtherNamesItem] }, optional: true, nullable: false, api_name: "otherNames"

          field :identifiers, -> { Internal::Types::Array[Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequestProfileDetailsIdentifiersItem] }, optional: true, nullable: false

          field :endpoints, -> { Internal::Types::Array[Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequestProfileDetailsEndpointsItem] }, optional: true, nullable: false

          field :certifications, -> { Internal::Types::Array[Affinity::Team::Invitations::Types::InvitePracticeTeamPersonRequestProfileDetailsCertificationsItem] }, optional: true, nullable: false
        end
      end
    end
  end
end
