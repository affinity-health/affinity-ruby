# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponsePrescriptionsItem < Internal::Types::Model
      field :version, -> { Integer }, optional: false, nullable: false

      field :days_supply, -> { Affinity::Types::GetOrderResponsePrescriptionsItemDaysSupply }, optional: false, nullable: true, api_name: "daysSupply"

      field :patient_snapshot, -> { Affinity::Types::GetOrderResponsePrescriptionsItemPatientSnapshot }, optional: false, nullable: false, api_name: "patientSnapshot"

      field :delivery_address, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true, api_name: "deliveryAddress"

      field :delivery_address_differs_from_patient, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "deliveryAddressDiffersFromPatient"

      field :provider_snapshot, -> { Affinity::Types::GetOrderResponsePrescriptionsItemProviderSnapshot }, optional: false, nullable: true, api_name: "providerSnapshot"

      field :clinical, -> { Affinity::Types::GetOrderResponsePrescriptionsItemClinical }, optional: false, nullable: true

      field :dispensing, -> { Affinity::Types::GetOrderResponsePrescriptionsItemDispensing }, optional: false, nullable: true

      field :structured_sig, -> { Affinity::Types::GetOrderResponsePrescriptionsItemStructuredSig }, optional: false, nullable: true, api_name: "structuredSig"

      field :external_prescription_id, -> { String }, optional: false, nullable: true, api_name: "externalPrescriptionId"

      field :catalog_item_id, -> { String }, optional: false, nullable: true, api_name: "catalogItemId"

      field :pharmacy_id, -> { String }, optional: false, nullable: true, api_name: "pharmacyId"

      field :pharmacy_name, -> { String }, optional: false, nullable: true, api_name: "pharmacyName"

      field :directions, -> { String }, optional: false, nullable: false

      field :dosage_form, -> { String }, optional: false, nullable: true, api_name: "dosageForm"

      field :id, -> { String }, optional: false, nullable: false

      field :medication_name, -> { String }, optional: false, nullable: false, api_name: "medicationName"

      field :quantity, -> { Affinity::Types::GetOrderResponsePrescriptionsItemQuantity }, optional: false, nullable: false

      field :quantity_unit, -> { String }, optional: false, nullable: false, api_name: "quantityUnit"

      field :refills, -> { Integer }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :strength, -> { String }, optional: false, nullable: true
    end
  end
end
