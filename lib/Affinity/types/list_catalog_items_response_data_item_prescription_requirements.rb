# frozen_string_literal: true

module Affinity
  module Types
    class ListCatalogItemsResponseDataItemPrescriptionRequirements < Internal::Types::Model
      field :allowed_days_supply, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false, api_name: "allowedDaysSupply"

      field :allowed_quantities, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsAllowedQuantitiesItem] }, optional: true, nullable: false, api_name: "allowedQuantities"

      field :allowed_reason_categories, -> { Internal::Types::Array[Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsAllowedReasonCategoriesItem] }, optional: true, nullable: false, api_name: "allowedReasonCategories"

      field :reason_category_labels, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "reasonCategoryLabels"

      field :compounding_reason, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsCompoundingReason }, optional: false, nullable: false, api_name: "compoundingReason"

      field :compounding_reason_context, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsCompoundingReasonContext }, optional: true, nullable: false, api_name: "compoundingReasonContext"

      field :controlled_schedule, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsControlledSchedule }, optional: true, nullable: false, api_name: "controlledSchedule"

      field :default_days_supply, -> { Integer }, optional: true, nullable: false, api_name: "defaultDaysSupply"

      field :default_quantity, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsDefaultQuantity }, optional: true, nullable: false, api_name: "defaultQuantity"

      field :quantity_increment, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsQuantityIncrement }, optional: true, nullable: false, api_name: "quantityIncrement"

      field :default_sigs, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "defaultSigs"

      field :diagnosis, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsDiagnosis }, optional: false, nullable: false

      field :medication_review, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsMedicationReview }, optional: true, nullable: false, api_name: "medicationReview"

      field :diagnosis_review, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsDiagnosisReview }, optional: true, nullable: false, api_name: "diagnosisReview"

      field :max_refills, -> { Integer }, optional: true, nullable: false, api_name: "maxRefills"

      field :notes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :pharmacy_notes, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsPharmacyNotes }, optional: false, nullable: false, api_name: "pharmacyNotes"

      field :refills, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsRefills }, optional: false, nullable: false

      field :substitution, -> { Affinity::Types::ListCatalogItemsResponseDataItemPrescriptionRequirementsSubstitution }, optional: false, nullable: false
    end
  end
end
