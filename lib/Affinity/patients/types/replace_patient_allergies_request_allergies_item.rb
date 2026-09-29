# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class ReplacePatientAllergiesRequestAllergiesItem < Internal::Types::Model
        field :category, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemCategory }, optional: false, nullable: false

        field :code, -> { String }, optional: true, nullable: false

        field :code_system, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemCodeSystem }, optional: true, nullable: false, api_name: "codeSystem"

        field :reactions, -> { Internal::Types::Array[Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemReactionsItem] }, optional: false, nullable: false

        field :severity, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemSeverity }, optional: true, nullable: false

        field :source, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemSource }, optional: false, nullable: false

        field :substance, -> { String }, optional: false, nullable: false

        field :type, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemType }, optional: false, nullable: true

        field :verification_status, -> { Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItemVerificationStatus }, optional: false, nullable: false, api_name: "verificationStatus"
      end
    end
  end
end
