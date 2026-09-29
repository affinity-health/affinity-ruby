# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPricingBasisPackage < Internal::Types::Model
      field :quantity, -> { String }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
