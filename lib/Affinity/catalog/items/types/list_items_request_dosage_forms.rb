# frozen_string_literal: true

module Affinity
  module Catalog
    module Items
      module Types
        class ListItemsRequestDosageForms < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { Affinity::Catalog::Items::Types::ListItemsRequestDosageFormsZero }

          member -> { Internal::Types::Array[Affinity::Catalog::Items::Types::ListItemsRequestDosageFormsOneItem] }
        end
      end
    end
  end
end
