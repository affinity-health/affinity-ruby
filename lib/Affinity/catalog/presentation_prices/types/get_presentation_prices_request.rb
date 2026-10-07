# frozen_string_literal: true

module Affinity
  module Catalog
    module PresentationPrices
      module Types
        class GetPresentationPricesRequest < Internal::Types::Model
          field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

          field :practice_id, -> { String }, optional: true, nullable: false, api_name: "practiceId"
        end
      end
    end
  end
end
