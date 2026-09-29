# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module ListOrdersRequestSort
        extend Affinity::Internal::Types::Enum

        NEWEST = "newest"
        OLDEST = "oldest"
      end
    end
  end
end
