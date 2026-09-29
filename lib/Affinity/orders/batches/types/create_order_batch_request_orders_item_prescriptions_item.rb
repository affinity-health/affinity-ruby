# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPrescriptionsItem < Internal::Types::Model
          field :external_prescription_id, -> { String }, optional: true, nullable: false, api_name: "externalPrescriptionId"

          field :clinical, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemClinical }, optional: true, nullable: false

          field :pharmacy_id, -> { String }, optional: true, nullable: false, api_name: "pharmacyId"

          field :days_supply, -> { Integer }, optional: false, nullable: false, api_name: "daysSupply"

          field :dispensing, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemDispensing }, optional: false, nullable: false

          field :directions, -> { String }, optional: false, nullable: false

          field :medication_id, -> { String }, optional: false, nullable: false, api_name: "medicationId"

          field :quantity, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemQuantity }, optional: false, nullable: false

          field :quantity_unit, -> { String }, optional: false, nullable: false, api_name: "quantityUnit"

          field :refills, -> { Integer }, optional: false, nullable: false

          field :structured_sig, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPrescriptionsItemStructuredSig }, optional: true, nullable: false, api_name: "structuredSig"
        end
      end
    end
  end
end
