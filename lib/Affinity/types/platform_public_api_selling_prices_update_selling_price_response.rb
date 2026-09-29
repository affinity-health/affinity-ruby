# frozen_string_literal: true

module Affinity
  module Types
    class PlatformPublicAPISellingPricesUpdateSellingPriceResponse < Internal::Types::Model
      field :amount_cents, -> { Integer }, optional: false, nullable: true, api_name: "amountCents"

      field :version, -> { Integer }, optional: false, nullable: false

      field :currency, -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseCurrency }, optional: false, nullable: false

      field :basis, -> { Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponseBasis }, optional: false, nullable: false

      field :purchase_amount_cents, -> { Integer }, optional: false, nullable: false, api_name: "purchaseAmountCents"

      field :requires_review, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requiresReview"
    end
  end
end
