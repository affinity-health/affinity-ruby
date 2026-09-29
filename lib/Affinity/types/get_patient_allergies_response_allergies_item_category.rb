# frozen_string_literal: true

module Affinity
  module Types
    module GetPatientAllergiesResponseAllergiesItemCategory
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
