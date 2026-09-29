# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        module ListItemsRequestSort
          extend Affinity::Internal::Types::Enum

          RELEVANCE = "relevance"
          NAME_ASC = "name_asc"
          NAME_DESC = "name_desc"
        end
      end
    end
  end
end
