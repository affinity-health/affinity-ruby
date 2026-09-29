# frozen_string_literal: true

module Affinity
  module Webhooks
    module Events
      module Types
        class ListEventsRequest < Internal::Types::Model
          field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :status, -> { Affinity::Webhooks::Events::Types::ListEventsRequestStatus }, optional: true, nullable: false

          field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

          field :affinity_organization_id, -> { String }, optional: true, nullable: false, api_name: "X-Affinity-Organization-Id"
        end
      end
    end
  end
end
