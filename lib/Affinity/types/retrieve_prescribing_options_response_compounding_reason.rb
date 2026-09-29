# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCompoundingReason < Internal::Types::Model
      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :category_required, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "categoryRequired"

      field :context, -> { Affinity::Types::RetrievePrescribingOptionsResponseCompoundingReasonContext }, optional: false, nullable: false

      field :context_prompt, -> { String }, optional: false, nullable: true, api_name: "contextPrompt"

      field :choices, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCompoundingReasonChoicesItem] }, optional: false, nullable: false
    end
  end
end
