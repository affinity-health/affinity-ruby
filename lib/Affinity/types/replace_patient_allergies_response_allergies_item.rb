# frozen_string_literal: true

module Affinity
  module Types
    class ReplacePatientAllergiesResponseAllergiesItem < Internal::Types::Model
      field :category, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemCategory }, optional: false, nullable: false

      field :code, -> { String }, optional: false, nullable: true

      field :code_system, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemCodeSystem }, optional: false, nullable: true, api_name: "codeSystem"

      field :id, -> { String }, optional: false, nullable: false

      field :reactions, -> { Internal::Types::Array[Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemReactionsItem] }, optional: false, nullable: false

      field :severity, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemSeverity }, optional: false, nullable: true

      field :source, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemSource }, optional: false, nullable: false

      field :substance, -> { String }, optional: false, nullable: false

      field :type, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemType }, optional: false, nullable: true

      field :verification_status, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemVerificationStatus }, optional: false, nullable: false, api_name: "verificationStatus"
    end
  end
end
