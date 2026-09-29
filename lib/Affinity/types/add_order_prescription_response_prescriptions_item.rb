# frozen_string_literal: true

module Affinity
  module Types
    class AddOrderPrescriptionResponsePrescriptionsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_prescription_id, -> { String }, optional: false, nullable: true, api_name: "externalPrescriptionId"

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
