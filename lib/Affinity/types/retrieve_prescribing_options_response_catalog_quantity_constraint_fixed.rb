# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogQuantityConstraintFixed < Internal::Types::Model
      field :quantity, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraintFixedQuantity }, optional: false, nullable: false
    end
  end
end
