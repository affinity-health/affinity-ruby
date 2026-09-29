# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponsePrescriptionsItemQuantity < Internal::Types::Model
      field :value, -> { Integer }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
