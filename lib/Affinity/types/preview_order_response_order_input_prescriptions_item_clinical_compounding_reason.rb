# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPrescriptionsItemClinicalCompoundingReason < Internal::Types::Model
      field :category, -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalCompoundingReasonCategory }, optional: true, nullable: false

      field :context, -> { String }, optional: true, nullable: false
    end
  end
end
