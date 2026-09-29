# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestOtcItemsItem < Internal::Types::Model
        field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

        field :quantity, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
