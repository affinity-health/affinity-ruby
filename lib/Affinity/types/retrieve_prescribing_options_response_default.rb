# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseDefault < Internal::Types::Model
      field :directions, -> { String }, optional: false, nullable: false

      field :format, -> { Affinity::Types::RetrievePrescribingOptionsResponseDefaultFormat }, optional: false, nullable: false

      field :source, -> { Affinity::Types::RetrievePrescribingOptionsResponseDefaultSource }, optional: false, nullable: false

      field :structured_sig, -> { Affinity::Types::RetrievePrescribingOptionsResponseDefaultStructuredSig }, optional: false, nullable: true, api_name: "structuredSig"
    end
  end
end
