# frozen_string_literal: true

module Affinity
  module Webhooks
    module Types
      class ListWebhookGrantsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :starting_after, -> { String }, optional: true, nullable: false, api_name: "startingAfter"

        field :ending_before, -> { String }, optional: true, nullable: false, api_name: "endingBefore"
      end
    end
  end
end
