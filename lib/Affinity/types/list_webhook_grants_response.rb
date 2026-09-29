# frozen_string_literal: true

module Affinity
  module Types
    class ListWebhookGrantsResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::ListWebhookGrantsResponseObject }, optional: false, nullable: false

      field :data, -> { Internal::Types::Array[Affinity::Types::ListWebhookGrantsResponseDataItem] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :url, -> { Affinity::Types::ListWebhookGrantsResponseURL }, optional: false, nullable: false
    end
  end
end
