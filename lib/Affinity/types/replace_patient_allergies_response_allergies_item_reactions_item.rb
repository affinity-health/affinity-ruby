# frozen_string_literal: true

module Affinity
  module Types
    class ReplacePatientAllergiesResponseAllergiesItemReactionsItem < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: true

      field :code_system, -> { Affinity::Types::ReplacePatientAllergiesResponseAllergiesItemReactionsItemCodeSystem }, optional: false, nullable: true, api_name: "codeSystem"

      field :display, -> { String }, optional: false, nullable: false
    end
  end
end
