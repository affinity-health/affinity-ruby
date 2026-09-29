# frozen_string_literal: true

module Affinity
  module Types
    class GetAccountResponse < Internal::Types::Model
      field :account, -> { Affinity::Types::GetAccountResponseAccount }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :scopes, -> { Internal::Types::Array[String] }, optional: false, nullable: true

      field :membership, -> { Affinity::Types::GetAccountResponseMembership }, optional: false, nullable: false

      field :operating_mode, -> { Affinity::Types::GetAccountResponseOperatingMode }, optional: false, nullable: false, api_name: "operatingMode"

      field :user, -> { Affinity::Types::GetAccountResponseUser }, optional: false, nullable: false
    end
  end
end
