# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPrescriptionsItemClinical < Internal::Types::Model
          field :compounding_reason, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

          field :medication_review_status, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

          field :diagnosis_review_status, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

          field :current_medications, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "currentMedications"

          field :diagnoses, -> { Internal::Types::Array[Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalDiagnosesItem] }, optional: true, nullable: false

          field :observations, -> { Internal::Types::Array[Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
        end
      end
    end
  end
end
