# frozen_string_literal: true

module Affinity
  module APIKeys
    module Types
      class CreatePlatformPracticeAPIKeyRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :allowed_ips, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "allowedIps"

        field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"

        field :name, -> { String }, optional: false, nullable: false

        field :scopes, -> { Internal::Types::Array[Affinity::APIKeys::Types::CreatePlatformPracticeAPIKeyRequestScopesItem] }, optional: true, nullable: false
      end
    end
  end
end
