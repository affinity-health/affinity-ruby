# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseCancellation < Internal::Types::Model
      field :status, -> { Affinity::Types::CancelOrderResponseCancellationStatus }, optional: false, nullable: false

      field :outcomes, -> { Internal::Types::Array[Affinity::Types::CancelOrderResponseCancellationOutcomesItem] }, optional: false, nullable: false
    end
  end
end
