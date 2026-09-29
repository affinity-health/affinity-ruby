# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalCompoundingReason < Internal::Types::Model
          field :category, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalCompoundingReasonCategory }, optional: true, nullable: false

          field :context, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
