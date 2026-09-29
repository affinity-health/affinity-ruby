# frozen_string_literal: true

module Affinity
  module Patients
    module Addresses
      module Types
        class UpdatePatientAddressRequest < Internal::Types::Model
          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

          field :address_id, -> { String }, optional: false, nullable: false, api_name: "addressId"

          field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

          field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

          field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

          field :address, -> { Affinity::Patients::Addresses::Types::UpdatePatientAddressRequestAddress }, optional: true, nullable: false

          field :label, -> { String }, optional: true, nullable: false

          field :recipient_name, -> { String }, optional: true, nullable: false, api_name: "recipientName"

          field :preferred_shipping, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "preferredShipping"
        end
      end
    end
  end
end
