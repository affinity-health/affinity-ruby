# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalMedicationReviewStatus
        extend Affinity::Internal::Types::Enum

        NOT_REVIEWED = "not_reviewed"
        NONE = "none"
        RECORDED = "recorded"
      end
    end
  end
end
