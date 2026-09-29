# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestShipping < Internal::Types::Model
        field :selection, -> { Affinity::Orders::Types::PreviewOrderRequestShippingSelection }, optional: true, nullable: false
      end
    end
  end
end
