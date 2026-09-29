# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemClinicalAllergiesItemReactionsItem < Internal::Types::Model
      field :code, -> { String }, optional: true, nullable: false

      field :code_system, -> { String }, optional: true, nullable: false, api_name: "codeSystem"

      field :display, -> { String }, optional: false, nullable: false

      field :source, -> { String }, optional: true, nullable: false
    end
  end
end
