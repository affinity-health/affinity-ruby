# frozen_string_literal: true

module Affinity
  module Orders
    module Prescriptions
      module Types
        class AddOrderPrescriptionRequestPrescriptionDispensing < Internal::Types::Model
          field :dispense_upon_acceptance, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "dispenseUponAcceptance"

          field :shipping_option_id, -> { String }, optional: true, nullable: false, api_name: "shippingOptionId"

          field :shipping_amount_cents, -> { Integer }, optional: true, nullable: false, api_name: "shippingAmountCents"

          field :shipping_destination_type, -> { Affinity::Orders::Prescriptions::Types::AddOrderPrescriptionRequestPrescriptionDispensingShippingDestinationType }, optional: true, nullable: false, api_name: "shippingDestinationType"

          field :pharmacy_notes, -> { String }, optional: true, nullable: false, api_name: "pharmacyNotes"

          field :requested_fill_date, -> { String }, optional: true, nullable: false, api_name: "requestedFillDate"

          field :substitution_permitted, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "substitutionPermitted"
        end
      end
    end
  end
end
