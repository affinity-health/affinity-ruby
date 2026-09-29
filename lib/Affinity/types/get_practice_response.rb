# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeResponse < Internal::Types::Model
      field :address, -> { Affinity::Types::GetPracticeResponseAddress }, optional: false, nullable: true

      field :contacts, -> { Affinity::Types::GetPracticeResponseContacts }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: true, api_name: "legalName"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::GetPracticeResponseObject }, optional: false, nullable: false

      field :prescribers, -> { Internal::Types::Array[Affinity::Types::GetPracticeResponsePrescribersItem] }, optional: false, nullable: false

      field :live_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "liveEnabled"

      field :support_email, -> { String }, optional: false, nullable: true, api_name: "supportEmail"

      field :support_phone, -> { String }, optional: false, nullable: true, api_name: "supportPhone"

      field :timezone, -> { String }, optional: false, nullable: true
    end
  end
end
