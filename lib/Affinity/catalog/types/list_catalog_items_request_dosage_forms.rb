# frozen_string_literal: true

module Affinity
  module Catalog
    module Types
      class ListCatalogItemsRequestDosageForms < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        member -> { Affinity::Catalog::Types::ListCatalogItemsRequestDosageFormsZero }

        member -> { Internal::Types::Array[Affinity::Catalog::Types::ListCatalogItemsRequestDosageFormsOneItem] }
      end
    end
  end
end
