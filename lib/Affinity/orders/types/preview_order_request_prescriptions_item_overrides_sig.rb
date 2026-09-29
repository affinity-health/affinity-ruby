# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriptionsItemOverridesSig < Internal::Types::Model
        extend Affinity::Internal::Types::Union

        discriminant :format

        member -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesSigStructured }, key: "STRUCTURED"

        member -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesSigFreeText }, key: "FREE_TEXT"

        member -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverridesSigTemplate }, key: "TEMPLATE"
      end
    end
  end
end
