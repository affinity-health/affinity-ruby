# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class AddOrderPrescriptionRequestPrescriptionClinicalObservationsItem < Internal::Types::Model
        field :display, -> { String }, optional: false, nullable: false

        field :unit, -> { String }, optional: false, nullable: false

        field :value, -> { Affinity::Orders::Types::AddOrderPrescriptionRequestPrescriptionClinicalObservationsItemValue }, optional: false, nullable: false
      end
    end
  end
end
