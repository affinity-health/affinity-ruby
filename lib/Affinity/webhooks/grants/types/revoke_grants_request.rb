# frozen_string_literal: true

module Affinity
  module Webhooks
    module Grants
      module Types
        class RevokeGrantsRequest < Internal::Types::Model
          field :platform_id, -> { String }, optional: false, nullable: false, api_name: "platformId"

          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        end
      end
    end
  end
end
