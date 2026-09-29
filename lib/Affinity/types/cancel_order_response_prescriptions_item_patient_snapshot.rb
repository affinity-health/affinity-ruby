# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemPatientSnapshot < Internal::Types::Model
      field :address, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :allergy_review_status, -> { Affinity::Types::CancelOrderResponsePrescriptionsItemPatientSnapshotAllergyReviewStatus }, optional: true, nullable: false, api_name: "allergyReviewStatus"

      field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"

      field :email, -> { String }, optional: true, nullable: false

      field :gender, -> { Affinity::Types::CancelOrderResponsePrescriptionsItemPatientSnapshotGender }, optional: true, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false, api_name: "legalName"

      field :phone, -> { String }, optional: true, nullable: false

      field :state, -> { String }, optional: false, nullable: false
    end
  end
end
