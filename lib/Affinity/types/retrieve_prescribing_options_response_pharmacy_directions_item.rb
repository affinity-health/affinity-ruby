# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponsePharmacyDirectionsItem < Internal::Types::Model
      field :directions, -> { String }, optional: false, nullable: false

      field :format, -> { Affinity::Types::RetrievePrescribingOptionsResponsePharmacyDirectionsItemFormat }, optional: false, nullable: false

      field :structured_sig, -> { Affinity::Types::RetrievePrescribingOptionsResponsePharmacyDirectionsItemStructuredSig }, optional: false, nullable: true, api_name: "structuredSig"
    end
  end
end
