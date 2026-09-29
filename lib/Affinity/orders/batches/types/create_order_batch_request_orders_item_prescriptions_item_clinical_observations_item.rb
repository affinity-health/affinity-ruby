# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalObservationsItem < Internal::Types::Model
          field :display, -> { String }, optional: false, nullable: false

          field :unit, -> { String }, optional: false, nullable: false

          field :value, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalObservationsItemValue }, optional: false, nullable: false
        end
      end
    end
  end
end
