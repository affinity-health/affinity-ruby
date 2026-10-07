# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasisItem }, key: "ITEM"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasisUnit }, key: "UNIT"
    end
  end
end
