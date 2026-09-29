# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :affinity_actor_id, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Id"

        field :affinity_actor_type, -> { String }, optional: true, nullable: false, api_name: "Affinity-Actor-Type"

        field :address, -> { Affinity::Patients::Types::CreatePatientRequestAddress }, optional: true, nullable: false

        field :clinical_profile, -> { Affinity::Patients::Types::CreatePatientRequestClinicalProfile }, optional: true, nullable: false, api_name: "clinicalProfile"

        field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"

        field :email, -> { String }, optional: true, nullable: false

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :external_identities, -> { Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestExternalIdentitiesItem] }, optional: true, nullable: false, api_name: "externalIdentities"

        field :addresses, -> { Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestAddressesItem] }, optional: true, nullable: false

        field :encounters, -> { Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestEncountersItem] }, optional: true, nullable: false

        field :gender, -> { Affinity::Patients::Types::CreatePatientRequestGender }, optional: true, nullable: false

        field :location_id, -> { String }, optional: true, nullable: false, api_name: "locationId"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :medical_record_number, -> { String }, optional: true, nullable: false, api_name: "medicalRecordNumber"

        field :measurements, -> { Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestMeasurementsItem] }, optional: true, nullable: false

        field :name, -> { Affinity::Patients::Types::CreatePatientRequestName }, optional: false, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :programs, -> { Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestProgramsItem] }, optional: true, nullable: false
      end
    end
  end
end
