# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseLifecycleEventsItem < Internal::Types::Model
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :event_type, -> { String }, optional: false, nullable: false, api_name: "eventType"

      field :id, -> { String }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false

      field :source, -> { Affinity::Types::CancelOrderResponseLifecycleEventsItemSource }, optional: false, nullable: false
    end
  end
end
