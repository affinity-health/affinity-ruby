# frozen_string_literal: true

module Affinity
  module Patients
    module Allergies
      module Types
        class ReplacePatientAllergiesRequestAllergiesItemReactionsItem < Internal::Types::Model
          field :code, -> { String }, optional: true, nullable: false

          field :code_system, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemReactionsItemCodeSystem }, optional: true, nullable: false, api_name: "codeSystem"

          field :display, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
