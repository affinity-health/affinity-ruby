# frozen_string_literal: true

module Affinity
  module PlatformPricing
    module Types
      class PlatformPublicAPISellingPricesUpdateSellingPriceRequest < Internal::Types::Model
        field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :practice_id, -> { String }, optional: true, nullable: false, api_name: "practiceId"

        field :amount_cents, -> { Integer }, optional: false, nullable: true, api_name: "amountCents"

        field :base_version, -> { Integer }, optional: false, nullable: false, api_name: "baseVersion"
      end
    end
  end
end
