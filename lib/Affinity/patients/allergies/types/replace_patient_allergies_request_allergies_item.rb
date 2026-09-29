# frozen_string_literal: true

module Affinity
  module Patients
    module Allergies
      module Types
        class ReplacePatientAllergiesRequestAllergiesItem < Internal::Types::Model
          field :category, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemCategory }, optional: false, nullable: false

          field :code, -> { String }, optional: true, nullable: false

          field :code_system, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemCodeSystem }, optional: true, nullable: false, api_name: "codeSystem"

          field :reactions, -> { Internal::Types::Array[Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemReactionsItem] }, optional: false, nullable: false

          field :severity, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemSeverity }, optional: true, nullable: false

          field :source, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemSource }, optional: false, nullable: false

          field :substance, -> { String }, optional: false, nullable: false

          field :type, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemType }, optional: false, nullable: true

          field :verification_status, -> { Affinity::Patients::Allergies::Types::ReplacePatientAllergiesRequestAllergiesItemVerificationStatus }, optional: false, nullable: false, api_name: "verificationStatus"
        end
      end
    end
  end
end
