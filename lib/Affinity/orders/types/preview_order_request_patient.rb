# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPatient < Internal::Types::Model
        field :address, -> { Affinity::Orders::Types::PreviewOrderRequestPatientAddress }, optional: true, nullable: false

        field :clinical_profile, -> { Affinity::Orders::Types::PreviewOrderRequestPatientClinicalProfile }, optional: true, nullable: false, api_name: "clinicalProfile"

        field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"

        field :email, -> { String }, optional: true, nullable: false

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :external_identities, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPatientExternalIdentitiesItem] }, optional: true, nullable: false, api_name: "externalIdentities"

        field :addresses, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPatientAddressesItem] }, optional: true, nullable: false

        field :encounters, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPatientEncountersItem] }, optional: true, nullable: false

        field :gender, -> { Affinity::Orders::Types::PreviewOrderRequestPatientGender }, optional: true, nullable: false

        field :location_id, -> { String }, optional: true, nullable: false, api_name: "locationId"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :medical_record_number, -> { String }, optional: true, nullable: false, api_name: "medicalRecordNumber"

        field :measurements, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPatientMeasurementsItem] }, optional: true, nullable: false

        field :name, -> { Affinity::Orders::Types::PreviewOrderRequestPatientName }, optional: false, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :programs, -> { Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPatientProgramsItem] }, optional: true, nullable: false
      end
    end
  end
end
