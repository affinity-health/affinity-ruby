# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItem < Internal::Types::Model
      field :address, -> { Affinity::Types::ListPatientsResponseDataItemAddress }, optional: false, nullable: true

      field :default_shipping_address_id, -> { String }, optional: false, nullable: true, api_name: "defaultShippingAddressId"

      field :shipping_address, -> { Affinity::Types::ListPatientsResponseDataItemShippingAddress }, optional: false, nullable: true, api_name: "shippingAddress"

      field :allergy_review_status, -> { Affinity::Types::ListPatientsResponseDataItemAllergyReviewStatus }, optional: false, nullable: false, api_name: "allergyReviewStatus"

      field :allergy_summary, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItemAllergySummaryItem] }, optional: false, nullable: false, api_name: "allergySummary"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :clinical_profile, -> { Affinity::Types::ListPatientsResponseDataItemClinicalProfile }, optional: false, nullable: false, api_name: "clinicalProfile"

      field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"

      field :email, -> { String }, optional: false, nullable: true

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :external_identities, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItemExternalIdentitiesItem] }, optional: false, nullable: false, api_name: "externalIdentities"

      field :addresses, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItemAddressesItem] }, optional: false, nullable: false

      field :encounters, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItemEncountersItem] }, optional: false, nullable: false

      field :gender, -> { Affinity::Types::ListPatientsResponseDataItemGender }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :location, -> { Affinity::Types::ListPatientsResponseDataItemLocation }, optional: false, nullable: false

      field :location_id, -> { String }, optional: false, nullable: false, api_name: "locationId"

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :medical_record_number, -> { String }, optional: false, nullable: true, api_name: "medicalRecordNumber"

      field :measurements, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItemMeasurementsItem] }, optional: false, nullable: false

      field :name, -> { Affinity::Types::ListPatientsResponseDataItemName }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListPatientsResponseDataItemObject }, optional: false, nullable: false

      field :phone, -> { String }, optional: false, nullable: true

      field :programs, -> { Internal::Types::Array[Affinity::Types::ListPatientsResponseDataItemProgramsItem] }, optional: false, nullable: false

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :status, -> { Affinity::Types::ListPatientsResponseDataItemStatus }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
