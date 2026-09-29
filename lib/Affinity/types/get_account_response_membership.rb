# frozen_string_literal: true

module Affinity
  module Types
    class GetAccountResponseMembership < Internal::Types::Model
      field :permissions, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :role, -> { Affinity::Types::GetAccountResponseMembershipRole }, optional: false, nullable: false

      field :role_name, -> { String }, optional: false, nullable: false, api_name: "roleName"

      field :status, -> { Affinity::Types::GetAccountResponseMembershipStatus }, optional: false, nullable: false
    end
  end
end
