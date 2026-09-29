# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricingBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisItem }, key: "ITEM"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::ListCatalogItemsResponseDataItemPricingBasisUnit }, key: "UNIT"
    end
  end
end
