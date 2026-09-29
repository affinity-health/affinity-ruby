# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemPrescriptionsItemClinicalAllergiesItem < Internal::Types::Model
      field :code, -> { String }, optional: true, nullable: false

      field :code_system, -> { String }, optional: true, nullable: false, api_name: "codeSystem"

      field :display, -> { String }, optional: false, nullable: false

      field :source, -> { String }, optional: true, nullable: false

      field :category, -> { String }, optional: true, nullable: false

      field :severity, -> { String }, optional: true, nullable: false

      field :type, -> { String }, optional: true, nullable: false

      field :verification_status, -> { String }, optional: true, nullable: false, api_name: "verificationStatus"

      field :reactions, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemPrescriptionsItemClinicalAllergiesItemReactionsItem] }, optional: true, nullable: false
    end
  end
end
