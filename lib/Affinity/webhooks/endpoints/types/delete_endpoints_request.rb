# frozen_string_literal: true

module Affinity
  module Webhooks
    module Endpoints
      module Types
        class DeleteEndpointsRequest < Internal::Types::Model
          field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

          field :affinity_organization_id, -> { String }, optional: true, nullable: false, api_name: "X-Affinity-Organization-Id"

          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        end
      end
    end
  end
end
