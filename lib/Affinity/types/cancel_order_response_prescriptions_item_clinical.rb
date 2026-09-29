# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemClinical < Internal::Types::Model
      field :allergies, -> { Internal::Types::Array[Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalAllergiesItem] }, optional: true, nullable: false

      field :medication_review_status, -> { Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

      field :diagnosis_review_status, -> { Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

      field :conditions, -> { Internal::Types::Array[Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalConditionsItem] }, optional: true, nullable: false

      field :compounding_reason, -> { Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

      field :medications, -> { Internal::Types::Array[Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalMedicationsItem] }, optional: true, nullable: false

      field :observations, -> { Internal::Types::Array[Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
    end
  end
end
