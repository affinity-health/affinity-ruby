# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderResponsePrescriptionsItem < Internal::Types::Model
      field :pharmacy_id, -> { String }, optional: false, nullable: false, api_name: "pharmacyId"

      field :external_prescription_id, -> { String }, optional: false, nullable: true, api_name: "externalPrescriptionId"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :directions, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :medication_id, -> { String }, optional: false, nullable: true, api_name: "medicationId"

      field :medication_name, -> { String }, optional: false, nullable: false, api_name: "medicationName"

      field :object, -> { Affinity::Types::CreateOrderResponsePrescriptionsItemObject }, optional: false, nullable: false

      field :quantity, -> { Affinity::Types::CreateOrderResponsePrescriptionsItemQuantity }, optional: false, nullable: false

      field :quantity_unit, -> { String }, optional: false, nullable: false, api_name: "quantityUnit"

      field :refills, -> { Integer }, optional: false, nullable: false

      field :status, -> { Affinity::Types::CreateOrderResponsePrescriptionsItemStatus }, optional: false, nullable: false
    end
  end
end
