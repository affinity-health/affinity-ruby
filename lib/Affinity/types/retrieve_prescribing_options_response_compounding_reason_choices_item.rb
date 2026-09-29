# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCompoundingReasonChoicesItem < Internal::Types::Model
      field :category, -> { Affinity::Types::RetrievePrescribingOptionsResponseCompoundingReasonChoicesItemCategory }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :context_required, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "contextRequired"

      field :context_prompt, -> { String }, optional: false, nullable: true, api_name: "contextPrompt"
    end
  end
end
