# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriptionsItemOverridesSigStructured < Internal::Types::Model
        field :fields, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesSigStructuredFields }, optional: false, nullable: false
      end
    end
  end
end
