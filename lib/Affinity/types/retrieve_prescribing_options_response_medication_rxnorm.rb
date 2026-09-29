# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseMedicationRxnorm < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :display, -> { String }, optional: false, nullable: false

      field :dose_form, -> { String }, optional: false, nullable: false, api_name: "doseForm"

      field :route, -> { String }, optional: false, nullable: false

      field :system, -> { Affinity::Types::RetrievePrescribingOptionsResponseMedicationRxnormSystem }, optional: false, nullable: false
    end
  end
end
