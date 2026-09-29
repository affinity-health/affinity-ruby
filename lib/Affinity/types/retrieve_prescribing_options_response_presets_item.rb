# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponsePresetsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :revision, -> { String }, optional: false, nullable: false

      field :source, -> { Affinity::Types::RetrievePrescribingOptionsResponsePresetsItemSource }, optional: false, nullable: false

      field :directions, -> { String }, optional: false, nullable: false

      field :format, -> { Affinity::Types::RetrievePrescribingOptionsResponsePresetsItemFormat }, optional: false, nullable: false

      field :structured_sig, -> { Affinity::Types::RetrievePrescribingOptionsResponsePresetsItemStructuredSig }, optional: false, nullable: true, api_name: "structuredSig"

      field :quantity, -> { Affinity::Types::RetrievePrescribingOptionsResponsePresetsItemQuantity }, optional: false, nullable: true

      field :days_supply, -> { Integer }, optional: false, nullable: true, api_name: "daysSupply"

      field :refills, -> { Integer }, optional: false, nullable: false
    end
  end
end
