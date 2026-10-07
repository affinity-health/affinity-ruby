# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponseMetadataValue < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { String }

      member -> { Integer }

      member -> { Internal::Types::Boolean }
    end
  end
end
