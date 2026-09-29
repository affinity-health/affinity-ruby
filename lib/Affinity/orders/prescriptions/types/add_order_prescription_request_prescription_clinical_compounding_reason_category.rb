# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        module AddOrderPrescriptionRequestPrescriptionClinicalCompoundingReasonCategory
          extend Affinity::Internal::Types::Enum

          ALCOHOL_FREE = "alcohol_free"
          DRUG_SHORTAGE = "drug_shortage"
          COMMERCIAL_PRODUCT_DISCONTINUED = "commercial_product_discontinued"
          MODIFIED_RELEASE = "modified_release"
          INACTIVE_INGREDIENT_SENSITIVITY = "inactive_ingredient_sensitivity"
          INACTIVE_INGREDIENT_TOXICITY = "inactive_ingredient_toxicity"
          CONCENTRATION_ADJUSTMENT = "concentration_adjustment"
          ALTERNATE_ROUTE = "alternate_route"
          DOSAGE_FORM_UNAVAILABLE = "dosage_form_unavailable"
          FLAVOR_ADJUSTMENT = "flavor_adjustment"
          TABLET_BURDEN = "tablet_burden"
          PATIENT_CANNOT_USE_COMMERCIAL_PRODUCT = "patient_cannot_use_commercial_product"
          NO_APPROVED_PRODUCT_AVAILABLE = "no_approved_product_available"
          NO_RATIONALE_REQUIRED = "no_rationale_required"
          OTHER_PATIENT_SPECIFIC_NEED = "other_patient_specific_need"
        end
      end
    end
  end
end
