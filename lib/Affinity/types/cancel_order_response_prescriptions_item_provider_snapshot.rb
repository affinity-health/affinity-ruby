# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemProviderSnapshot < Internal::Types::Model
      field :address, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :credentials, -> { String }, optional: true, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false, api_name: "legalName"

      field :license_number, -> { String }, optional: true, nullable: false, api_name: "licenseNumber"

      field :license_state, -> { String }, optional: true, nullable: false, api_name: "licenseState"

      field :license_expires_at, -> { String }, optional: true, nullable: false, api_name: "licenseExpiresAt"

      field :npi, -> { String }, optional: false, nullable: false

      field :phone, -> { String }, optional: true, nullable: false
    end
  end
end
