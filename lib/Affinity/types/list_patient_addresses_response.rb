# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientAddressesResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Affinity::Types::ListPatientAddressesResponseDataItem] }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListPatientAddressesResponseObject }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
