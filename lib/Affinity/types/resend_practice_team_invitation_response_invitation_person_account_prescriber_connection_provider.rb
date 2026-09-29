# frozen_string_literal: true

module Affinity
  module Types
    class ResendPracticeTeamInvitationResponseInvitationPersonAccountPrescriberConnectionProvider < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false, api_name: "legalName"

      field :credentials, -> { String }, optional: false, nullable: true

      field :phone, -> { String }, optional: false, nullable: true

      field :address, -> { Affinity::Types::ResendPracticeTeamInvitationResponseInvitationPersonAccountPrescriberConnectionProviderAddress }, optional: false, nullable: true

      field :npi, -> { String }, optional: false, nullable: false

      field :practice_status, -> { String }, optional: false, nullable: false, api_name: "practiceStatus"

      field :licenses, -> { Internal::Types::Array[Affinity::Types::ResendPracticeTeamInvitationResponseInvitationPersonAccountPrescriberConnectionProviderLicensesItem] }, optional: false, nullable: false
    end
  end
end
