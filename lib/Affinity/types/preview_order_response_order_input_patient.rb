# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatient < Internal::Types::Model
      field :address, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientAddress }, optional: true, nullable: false

      field :clinical_profile, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientClinicalProfile }, optional: true, nullable: false, api_name: "clinicalProfile"

      field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"

      field :email, -> { String }, optional: true, nullable: false

      field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

      field :external_identities, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPatientExternalIdentitiesItem] }, optional: true, nullable: false, api_name: "externalIdentities"

      field :addresses, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPatientAddressesItem] }, optional: true, nullable: false

      field :encounters, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPatientEncountersItem] }, optional: true, nullable: false

      field :gender, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientGender }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: false, api_name: "locationId"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :medical_record_number, -> { String }, optional: true, nullable: false, api_name: "medicalRecordNumber"

      field :measurements, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPatientMeasurementsItem] }, optional: true, nullable: false

      field :name, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientName }, optional: false, nullable: false

      field :phone, -> { String }, optional: true, nullable: false

      field :programs, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOrderInputPatientProgramsItem] }, optional: true, nullable: false
    end
  end
end
