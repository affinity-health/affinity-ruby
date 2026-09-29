# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        class AddOrderPrescriptionRequestExpectedVersionsItem < Internal::Types::Model
          field :prescription_id, -> { String }, optional: false, nullable: false, api_name: "prescriptionId"

          field :version, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
