# frozen_string_literal: true

module Affinity
  module Webhooks
    module Grants
      module Types
        class SaveWebhookGrantRequest < Internal::Types::Model
          field :platform_id, -> { String }, optional: false, nullable: false, api_name: "platformId"

          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

          field :scopes, -> { Internal::Types::Array[Affinity::Webhooks::Grants::Types::SaveWebhookGrantRequestScopesItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
