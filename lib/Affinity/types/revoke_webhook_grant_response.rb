# frozen_string_literal: true

module Affinity
  module Types
    class RevokeWebhookGrantResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::RevokeWebhookGrantResponseObject }, optional: false, nullable: false

      field :organization_id, -> { String }, optional: false, nullable: false, api_name: "organizationId"

      field :platform_id, -> { String }, optional: false, nullable: false, api_name: "platformId"

      field :revoked, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
