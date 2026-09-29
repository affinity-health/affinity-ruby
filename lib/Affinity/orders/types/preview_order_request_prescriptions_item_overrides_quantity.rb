# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriptionsItemOverridesQuantity < Internal::Types::Model
        field :value, -> { Integer }, optional: false, nullable: false

        field :unit, -> { String }, optional: false, nullable: false
      end
    end
  end
end
