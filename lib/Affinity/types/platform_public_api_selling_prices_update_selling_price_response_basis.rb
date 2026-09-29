# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasis < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisItem }, key: "ITEM"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisPackage }, key: "PACKAGE"

      member -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasisUnit }, key: "UNIT"
    end
  end
end
