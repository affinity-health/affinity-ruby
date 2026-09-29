# frozen_string_literal: true

module Affinity
  module Patients
    module Addresses
      module Types
        class ArchiveAddressesRequest < Internal::Types::Model
          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

          field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

          field :address_id, -> { String }, optional: false, nullable: false, api_name: "addressId"

          field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

          field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

          field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"
        end
      end
    end
  end
end
