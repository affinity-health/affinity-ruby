# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderResponseMetadataValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { String }

      member -> { Integer }

      member -> { Internal::Types::Boolean }
    end
  end
end
