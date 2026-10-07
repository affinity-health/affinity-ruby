# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisItem }, key: "ITEM"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasisUnit }, key: "UNIT"
    end
  end
end
