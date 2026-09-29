# frozen_string_literal: true

module Affinity
  module Types
    class GetAccountResponseUser < Internal::Types::Model
      field :email, -> { String }, optional: false, nullable: false

      field :email_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "emailVerified"

      field :image, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: false

      field :two_factor_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "twoFactorEnabled"

      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"
    end
  end
end
