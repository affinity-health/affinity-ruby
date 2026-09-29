# frozen_string_literal: true

module Affinity
  module Types
    class ListPharmaciesResponseDataItem < Internal::Types::Model
      field :access, -> { Affinity::Types::ListPharmaciesResponseDataItemAccess }, optional: false, nullable: false

      field :catalog_item_count, -> { Integer }, optional: false, nullable: false, api_name: "catalogItemCount"

      field :facility_type, -> { String }, optional: false, nullable: false, api_name: "facilityType"

      field :facility_locations, -> { Internal::Types::Array[Affinity::Types::ListPharmaciesResponseDataItemFacilityLocationsItem] }, optional: false, nullable: false, api_name: "facilityLocations"

      field :id, -> { String }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :logo_url, -> { String }, optional: false, nullable: true, api_name: "logoUrl"

      field :name, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListPharmaciesResponseDataItemObject }, optional: false, nullable: false

      field :prescriptions_last30days, -> { Integer }, optional: false, nullable: false, api_name: "prescriptionsLast30Days"

      field :profile, -> { Affinity::Types::ListPharmaciesResponseDataItemProfile }, optional: false, nullable: true

      field :restricted_states, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "restrictedStates"

      field :shipping_options, -> { Internal::Types::Array[Affinity::Types::ListPharmaciesResponseDataItemShippingOptionsItem] }, optional: false, nullable: false, api_name: "shippingOptions"

      field :supported_states, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "supportedStates"
    end
  end
end
