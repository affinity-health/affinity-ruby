# frozen_string_literal: true

module Affinity
  module Types
    class ListWebhookEventsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListWebhookEventsResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListWebhookEventsResponseObject }, optional: false, nullable: false

      field :url, -> { Affinity::Types::ListWebhookEventsResponseURL }, optional: false, nullable: false
    end
  end
end
