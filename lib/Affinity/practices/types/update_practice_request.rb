# frozen_string_literal: true

module Affinity
  module Practices
    module Types
      class UpdatePracticeRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

        field :live_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "liveEnabled"

        field :address, -> { Affinity::Practices::Types::UpdatePracticeRequestAddress }, optional: true, nullable: false

        field :attestations, -> { Affinity::Practices::Types::UpdatePracticeRequestAttestations }, optional: true, nullable: false

        field :compliance_contact, -> { Affinity::Practices::Types::UpdatePracticeRequestComplianceContact }, optional: true, nullable: false, api_name: "complianceContact"

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :prescribers, -> { Internal::Types::Array[Affinity::Practices::Types::UpdatePracticeRequestPrescribersItem] }, optional: true, nullable: false

        field :primary_contact, -> { Affinity::Practices::Types::UpdatePracticeRequestPrimaryContact }, optional: true, nullable: false, api_name: "primaryContact"

        field :support_email, -> { String }, optional: true, nullable: false, api_name: "supportEmail"

        field :support_phone, -> { String }, optional: true, nullable: false, api_name: "supportPhone"

        field :timezone, -> { String }, optional: true, nullable: false
      end
    end
  end
end
