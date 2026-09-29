# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseFormulationDefault < Internal::Types::Model
      field :directions, -> { String }, optional: false, nullable: false

      field :format, -> { Affinity::Types::RetrievePrescribingOptionsResponseFormulationDefaultFormat }, optional: false, nullable: false

      field :structured_sig, -> { Affinity::Types::RetrievePrescribingOptionsResponseFormulationDefaultStructuredSig }, optional: false, nullable: true, api_name: "structuredSig"
    end
  end
end
