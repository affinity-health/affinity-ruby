# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class UpdateOrderPrescriptionRequestPrescriptionClinicalCompoundingReason < Internal::Types::Model
        field :category, -> { Affinity::Orders::Types::UpdateOrderPrescriptionRequestPrescriptionClinicalCompoundingReasonCategory }, optional: true, nullable: false

        field :context, -> { String }, optional: true, nullable: false
      end
    end
  end
end
