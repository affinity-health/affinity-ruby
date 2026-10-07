# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadPresentationPriceResponseBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseBasisItem }, key: "ITEM"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseBasisUnit }, key: "UNIT"
    end
  end
end
