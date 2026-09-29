# frozen_string_literal: true

module Affinity
  module Catalog
    module Types
      class ListShippingOptionsRequest < Internal::Types::Model
        field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

        field :destination_state, -> { String }, optional: false, nullable: false, api_name: "destinationState"

        field :destination_type, -> { Affinity::Catalog::Types::ListShippingOptionsRequestDestinationType }, optional: true, nullable: false, api_name: "destinationType"
      end
    end
  end
end
