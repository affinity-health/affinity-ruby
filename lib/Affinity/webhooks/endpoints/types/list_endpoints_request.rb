# frozen_string_literal: true

module Affinity
  module Webhooks
    module Endpoints
      module Types
        class ListEndpointsRequest < Internal::Types::Model
          field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

          field :affinity_organization_id, -> { String }, optional: true, nullable: false, api_name: "X-Affinity-Organization-Id"
        end
      end
    end
  end
end
