# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        module ListItemsRequestRoutesOneItem
          extend Affinity::Internal::Types::Enum

          INJECTABLE = "injectable"
          NASAL = "nasal"
          ORAL = "oral"
          SUBLINGUAL = "sublingual"
          TOPICAL = "topical"
          UNKNOWN = "unknown"
        end
      end
    end
  end
end
