# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPrescriptionsItemClinical < Internal::Types::Model
      field :compounding_reason, -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

      field :medication_review_status, -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

      field :diagnosis_review_status, -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

      field :current_medications, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "currentMedications"

      field :diagnoses, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalDiagnosesItem] }, optional: true, nullable: false

      field :observations, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
    end
  end
end
