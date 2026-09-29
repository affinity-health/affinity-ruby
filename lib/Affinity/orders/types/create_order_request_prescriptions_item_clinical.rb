# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequestPrescriptionsItemClinical < Internal::Types::Model
        field :compounding_reason, -> { Affinity::Orders::Types::CreateOrderRequestPrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

        field :medication_review_status, -> { Affinity::Orders::Types::CreateOrderRequestPrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

        field :diagnosis_review_status, -> { Affinity::Orders::Types::CreateOrderRequestPrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

        field :current_medications, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "currentMedications"

        field :diagnoses, -> { Internal::Types::Array[Affinity::Orders::Types::CreateOrderRequestPrescriptionsItemClinicalDiagnosesItem] }, optional: true, nullable: false

        field :observations, -> { Internal::Types::Array[Affinity::Orders::Types::CreateOrderRequestPrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
      end
    end
  end
end
