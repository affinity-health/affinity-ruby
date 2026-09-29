# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        module AddOrderPrescriptionRequestPrescriptionClinicalMedicationReviewStatus
          extend Affinity::Internal::Types::Enum

          NOT_REVIEWED = "not_reviewed"
          NONE = "none"
          RECORDED = "recorded"
        end
      end
    end
  end
end
