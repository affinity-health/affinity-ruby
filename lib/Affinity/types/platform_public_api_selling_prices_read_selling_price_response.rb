# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesReadSellingPriceResponse < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: true, api_name: "amountCents"

      field :version, -> { Integer }, optional: false, nullable: false

      field :currency, -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseCurrency }, optional: false, nullable: false

      field :affinity_price_cents, -> { Integer }, optional: false, nullable: true, api_name: "affinityPriceCents"

      field :affinity_basis, -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseAffinityBasis }, optional: false, nullable: true, api_name: "affinityBasis"

      field :basis, -> { Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponseBasis }, optional: false, nullable: false

      field :purchase_amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "purchaseAmountCents"

      field :requires_review, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requiresReview"
    end
  end
end
