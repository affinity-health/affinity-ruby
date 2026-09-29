# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        class AddOrderPrescriptionRequestPrescriptionClinical < Internal::Types::Model
          field :compounding_reason, -> { Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

          field :medication_review_status, -> { Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

          field :diagnosis_review_status, -> { Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

          field :current_medications, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "currentMedications"

          field :diagnoses, -> { Internal::Types::Array[Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalDiagnosesItem] }, optional: true, nullable: false

          field :observations, -> { Internal::Types::Array[Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalObservationsItem] }, optional: true, nullable: false
        end
      end
    end
  end
end
