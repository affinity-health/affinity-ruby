# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadSellingPriceResponseBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseBasisItem }, key: "ITEM"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseBasisUnit }, key: "UNIT"
    end
  end
end
