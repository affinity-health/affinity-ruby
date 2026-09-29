# frozen_string_literal: true

module Affinity
  module Patients
    module Allergies
      module Types
        module ReplacePatientAllergiesRequestAllergiesItemCategory
          extend Affinity::Internal::Types::Enum

          DRUG = "drug"
          FOOD = "food"
          INSECT = "insect"
          LATEX = "latex"
          MOLD = "mold"
          PET = "pet"
          POLLEN = "pollen"
          ENVIRONMENTAL = "environmental"
          BIOLOGIC = "biologic"
          OTHER = "other"
        end
      end
    end
  end
end
