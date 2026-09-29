# frozen_string_literal: true

module Affinity
  module Types
    class SaveWebhookGrantResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::SaveWebhookGrantResponseObject }, optional: false, nullable: false

      field :organization_id, -> { String }, optional: false, nullable: false, api_name: "organizationId"

      field :platform_id, -> { String }, optional: false, nullable: false, api_name: "platformId"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :scopes, -> { Internal::Types::Array[Affinity::Types::SaveWebhookGrantResponseScopesItem] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
