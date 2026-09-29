# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        class AddOrderPrescriptionRequestPrescriptionClinicalObservationsItem < Internal::Types::Model
          field :display, -> { String }, optional: false, nullable: false

          field :unit, -> { String }, optional: false, nullable: false

          field :value, -> { Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionClinicalObservationsItemValue }, optional: false, nullable: false
        end
      end
    end
  end
end
