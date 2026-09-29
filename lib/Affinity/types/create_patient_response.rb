# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponse < Internal::Types::Model
      field :address, -> { Affinity::Types::CreatePatientResponseAddress }, optional: false, nullable: true

      field :default_shipping_address_id, -> { String }, optional: false, nullable: true, api_name: "defaultShippingAddressId"

      field :shipping_address, -> { Affinity::Types::CreatePatientResponseShippingAddress }, optional: false, nullable: true, api_name: "shippingAddress"

      field :allergy_review_status, -> { Affinity::Types::CreatePatientResponseAllergyReviewStatus }, optional: false, nullable: false, api_name: "allergyReviewStatus"

      field :allergy_summary, -> { Internal::Types::Array[Affinity::Types::CreatePatientResponseAllergySummaryItem] }, optional: false, nullable: false, api_name: "allergySummary"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :clinical_profile, -> { Affinity::Types::CreatePatientResponseClinicalProfile }, optional: false, nullable: false, api_name: "clinicalProfile"

      field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"

      field :email, -> { String }, optional: false, nullable: true

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :external_identities, -> { Internal::Types::Array[Affinity::Types::CreatePatientResponseExternalIdentitiesItem] }, optional: false, nullable: false, api_name: "externalIdentities"

      field :addresses, -> { Internal::Types::Array[Affinity::Types::CreatePatientResponseAddressesItem] }, optional: false, nullable: false

      field :encounters, -> { Internal::Types::Array[Affinity::Types::CreatePatientResponseEncountersItem] }, optional: false, nullable: false

      field :gender, -> { Affinity::Types::CreatePatientResponseGender }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :location, -> { Affinity::Types::CreatePatientResponseLocation }, optional: false, nullable: false

      field :location_id, -> { String }, optional: false, nullable: false, api_name: "locationId"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :medical_record_number, -> { String }, optional: false, nullable: true, api_name: "medicalRecordNumber"

      field :measurements, -> { Internal::Types::Array[Affinity::Types::CreatePatientResponseMeasurementsItem] }, optional: false, nullable: false

      field :name, -> { Affinity::Types::CreatePatientResponseName }, optional: false, nullable: false

      field :object, -> { Affinity::Types::CreatePatientResponseObject }, optional: false, nullable: false

      field :phone, -> { String }, optional: false, nullable: true

      field :programs, -> { Internal::Types::Array[Affinity::Types::CreatePatientResponseProgramsItem] }, optional: false, nullable: false

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :status, -> { Affinity::Types::CreatePatientResponseStatus }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
