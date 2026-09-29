# frozen_string_literal: true

module Affinity
  module Types
    module PreviewOrderResponseClinicalRequirementsItemType
      extend Affinity::Internal::Types::Enum

      ALLERGY_REVIEW = "allergy_review"
      MEDICATION_REVIEW = "medication_review"
      DIAGNOSIS_REVIEW = "diagnosis_review"
      DIAGNOSIS = "diagnosis"
    end
  end
end
