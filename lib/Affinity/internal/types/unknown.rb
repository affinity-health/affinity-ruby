# frozen_string_literal: true

module Affinity
  module Internal
    module Types
      module Unknown
        include Affinity::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
