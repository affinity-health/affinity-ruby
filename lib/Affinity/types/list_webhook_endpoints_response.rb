# frozen_string_literal: true

module Affinity
  module Types
    class ListWebhookEndpointsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListWebhookEndpointsResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :object, -> { Affinity::Types::ListWebhookEndpointsResponseObject }, optional: false, nullable: false

      field :url, -> { Affinity::Types::ListWebhookEndpointsResponseURL }, optional: false, nullable: false
    end
  end
end
