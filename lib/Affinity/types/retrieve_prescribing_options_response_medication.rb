# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseMedication < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :rxnorm, -> { Affinity::Types::RetrievePrescribingOptionsResponseMedicationRxnorm }, optional: false, nullable: true
    end
  end
end
