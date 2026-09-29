# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemPrescriptionsItemClinical < Internal::Types::Model
      field :allergies, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalAllergiesItem] }, optional: true, nullable: false

      field :medication_review_status, -> { Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalMedicationReviewStatus }, optional: true, nullable: false, api_name: "medicationReviewStatus"

      field :diagnosis_review_status, -> { Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalDiagnosisReviewStatus }, optional: true, nullable: false, api_name: "diagnosisReviewStatus"

      field :conditions, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalConditionsItem] }, optional: true, nullable: false

      field :compounding_reason, -> { Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalCompoundingReason }, optional: true, nullable: false, api_name: "compoundingReason"

      field :medications, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalMedicationsItem] }, optional: true, nullable: false

      field :observations, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalObservationsItem] }, optional: true, nullable: false
    end
  end
end
