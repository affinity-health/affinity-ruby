# frozen_string_literal: true

module Affinity
  module Types
    class GetPatientAllergiesResponseAllergiesItem < Internal::Types::Model
      field :category, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemCategory }, optional: false, nullable: false

      field :code, -> { String }, optional: false, nullable: true

      field :code_system, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemCodeSystem }, optional: false, nullable: true, api_name: "codeSystem"

      field :id, -> { String }, optional: false, nullable: false

      field :reactions, -> { Internal::Types::Array[Affinity::Types::GetPatientAllergiesResponseAllergiesItemReactionsItem] }, optional: false, nullable: false

      field :severity, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemSeverity }, optional: false, nullable: true

      field :source, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemSource }, optional: false, nullable: false

      field :substance, -> { String }, optional: false, nullable: false

      field :type, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemType }, optional: false, nullable: true

      field :verification_status, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemVerificationStatus }, optional: false, nullable: false, api_name: "verificationStatus"
    end
  end
end
