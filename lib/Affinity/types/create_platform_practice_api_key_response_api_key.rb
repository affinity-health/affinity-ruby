# frozen_string_literal: true

module Affinity
  module Types
    class CreatePlatformPracticeAPIKeyResponseAPIKey < Internal::Types::Model
      field :allowed_ips, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "allowedIps"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :id, -> { String }, optional: false, nullable: false

      field :key_prefix, -> { String }, optional: false, nullable: false, api_name: "keyPrefix"

      field :last_used_at, -> { String }, optional: false, nullable: true, api_name: "lastUsedAt"

      field :mode, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseAPIKeyMode }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :revoked_at, -> { String }, optional: false, nullable: true, api_name: "revokedAt"

      field :scopes, -> { Internal::Types::Array[Affinity::Types::CreatePlatformPracticeAPIKeyResponseAPIKeyScopesItem] }, optional: false, nullable: false

      field :status, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseAPIKeyStatus }, optional: false, nullable: false
    end
  end
end
