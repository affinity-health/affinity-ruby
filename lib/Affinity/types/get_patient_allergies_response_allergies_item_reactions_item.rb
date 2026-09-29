# frozen_string_literal: true

module Affinity
  module Types
    class GetPatientAllergiesResponseAllergiesItemReactionsItem < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: true

      field :code_system, -> { Affinity::Types::GetPatientAllergiesResponseAllergiesItemReactionsItemCodeSystem }, optional: false, nullable: true, api_name: "codeSystem"

      field :display, -> { String }, optional: false, nullable: false
    end
  end
end
