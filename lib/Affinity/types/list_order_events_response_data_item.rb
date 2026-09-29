# frozen_string_literal: true

module Affinity
  module Types
    class ListOrderEventsResponseDataItem < Internal::Types::Model
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :event_type, -> { String }, optional: false, nullable: false, api_name: "eventType"

      field :id, -> { String }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListOrderEventsResponseDataItemObject }, optional: false, nullable: false
    end
  end
end
