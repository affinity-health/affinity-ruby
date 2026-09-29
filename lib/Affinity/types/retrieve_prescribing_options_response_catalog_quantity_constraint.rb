# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalogQuantityConstraint < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      discriminant :kind

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraintFixed }, key: "FIXED"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraintChoices }, key: "CHOICES"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraintRange }, key: "RANGE"

      member -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraintUnresolved }, key: "UNRESOLVED"
    end
  end
end
