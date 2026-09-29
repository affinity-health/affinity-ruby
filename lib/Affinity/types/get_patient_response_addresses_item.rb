# frozen_string_literal: true

module Affinity
  module Types
    class GetPatientResponseAddressesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :address, -> { Affinity::Types::GetPatientResponseAddressesItemAddress }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :preferred_shipping, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "preferredShipping"

      field :recipient_name, -> { String }, optional: false, nullable: true, api_name: "recipientName"

      field :archived_at, -> { String }, optional: false, nullable: true, api_name: "archivedAt"
    end
  end
end
