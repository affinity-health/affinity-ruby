# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderBatchRequestOrdersItemPrescriptionsItemClinical < Internal::Types::Model
        field :compounding_reason, -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

        field :medication_review_status, -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

        field :diagnosis_review_status, -> { Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

        field :current_medications, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "currentMedications"

        field :diagnoses, -> { Internal::Types::Array[Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalDiagnosesItem] }, optional: true, nullable: false

        field :observations, -> { Internal::Types::Array[Affinity::Orders::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
      end
    end
  end
end
