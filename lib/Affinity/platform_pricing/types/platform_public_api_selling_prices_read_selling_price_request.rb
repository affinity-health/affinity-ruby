# frozen_string_literal: true

module Affinity
  module PlatformPricing
    module Types
      class PlatformPublicAPISellingPricesReadSellingPriceRequest < Internal::Types::Model
        field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

        field :practice_id, -> { String }, optional: true, nullable: false, api_name: "practiceId"
      end
    end
  end
end
