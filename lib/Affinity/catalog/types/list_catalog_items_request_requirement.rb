# frozen_string_literal: true

module Affinity
  module Catalog
    module Types
      module ListCatalogItemsRequestRequirement
        extend Affinity::Internal::Types::Enum

        ALL = "all"
        OFFICE_USE = "office_use"
        PATIENT_SPECIFIC = "patient_specific"
      end
    end
  end
end
