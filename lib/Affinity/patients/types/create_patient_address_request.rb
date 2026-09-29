# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientAddressRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

        field :address, -> { Affinity::Patients::Types::CreatePatientAddressRequestAddress }, optional: false, nullable: false

        field :label, -> { String }, optional: true, nullable: false

        field :preferred_shipping, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "preferredShipping"

        field :recipient_name, -> { String }, optional: true, nullable: false, api_name: "recipientName"
      end
    end
  end
end
