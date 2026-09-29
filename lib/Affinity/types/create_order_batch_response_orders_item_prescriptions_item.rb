# frozen_string_literal: true

module Affinity
  module Types
    class CreateOrderBatchResponseOrdersItemPrescriptionsItem < Internal::Types::Model
      field :pharmacy_id, -> { String }, optional: false, nullable: false, api_name: "pharmacyId"

      field :external_prescription_id, -> { String }, optional: false, nullable: true, api_name: "externalPrescriptionId"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :directions, -> { String }, optional: false, nullable: false

      field :version, -> { Integer }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :medication_id, -> { String }, optional: false, nullable: true, api_name: "medicationId"

      field :medication_name, -> { String }, optional: false, nullable: false, api_name: "medicationName"

      field :object, -> { Affinity::Types::CreateOrderBatchResponseOrdersItemPrescriptionsItemObject }, optional: false, nullable: false

      field :quantity, -> { Affinity::Types::CreateOrderBatchResponseOrdersItemPrescriptionsItemQuantity }, optional: false, nullable: false

      field :quantity_unit, -> { String }, optional: false, nullable: false, api_name: "quantityUnit"

      field :refills, -> { Integer }, optional: false, nullable: false

      field :status, -> { Affinity::Types::CreateOrderBatchResponseOrdersItemPrescriptionsItemStatus }, optional: false, nullable: false
    end
  end
end
