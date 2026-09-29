# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponsePrescriptionsItemClinical < Internal::Types::Model
      field :allergies, -> { Internal::Types::Array[Affinity::Types::GetOrderResponsePrescriptionsItemClinicalAllergiesItem] }, optional: true, nullable: false

      field :medication_review_status, -> { Affinity::Types::GetOrderResponsePrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

      field :diagnosis_review_status, -> { Affinity::Types::GetOrderResponsePrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

      field :conditions, -> { Internal::Types::Array[Affinity::Types::GetOrderResponsePrescriptionsItemClinicalConditionsItem] }, optional: true, nullable: false

      field :compounding_reason, -> { Affinity::Types::GetOrderResponsePrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

      field :medications, -> { Internal::Types::Array[Affinity::Types::GetOrderResponsePrescriptionsItemClinicalMedicationsItem] }, optional: true, nullable: false

      field :observations, -> { Internal::Types::Array[Affinity::Types::GetOrderResponsePrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
    end
  end
end
