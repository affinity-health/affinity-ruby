# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadPresentationPriceResponse < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: true, api_name: "amountCents"

      field :version, -> { Integer }, optional: false, nullable: false

      field :currency, -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseCurrency }, optional: false, nullable: false

      field :affinity_price_cents, -> { Integer }, optional: false, nullable: true, api_name: "affinityPriceCents"

      field :affinity_basis, -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseAffinityBasis }, optional: false, nullable: true, api_name: "affinityBasis"

      field :basis, -> { Affinity::Types::PlatformPublicAPISellingPricesReadPresentationPriceResponseBasis }, optional: false, nullable: true
    end
  end
end
