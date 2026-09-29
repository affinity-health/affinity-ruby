# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseCatalog < Internal::Types::Model
      field :catalog_details, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogCatalogDetails }, optional: false, nullable: false, api_name: "catalogDetails"

      field :composition, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogComposition }, optional: false, nullable: false

      field :allowed_states, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "allowedStates"

      field :availability, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogAvailability }, optional: false, nullable: false

      field :catalog_kind, -> { String }, optional: false, nullable: false, api_name: "catalogKind"

      field :fulfillment_inclusions, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogFulfillmentInclusionsItem] }, optional: false, nullable: false, api_name: "fulfillmentInclusions"

      field :ordering, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogOrdering }, optional: false, nullable: false

      field :category, -> { String }, optional: false, nullable: true

      field :cold_ship, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "coldShip"

      field :pharmacy_id, -> { String }, optional: false, nullable: false, api_name: "pharmacyId"

      field :pharmacy_name, -> { String }, optional: false, nullable: false, api_name: "pharmacyName"

      field :description, -> { String }, optional: false, nullable: false

      field :dosage_form, -> { String }, optional: false, nullable: false, api_name: "dosageForm"

      field :facility_type, -> { String }, optional: false, nullable: false, api_name: "facilityType"

      field :id, -> { String }, optional: false, nullable: false

      field :image_url, -> { String }, optional: false, nullable: true, api_name: "imageUrl"

      field :image_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "imageUrls"

      field :medication_group, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogMedicationGroup }, optional: true, nullable: false, api_name: "medicationGroup"

      field :is_orderable, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isOrderable"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogObject }, optional: false, nullable: false

      field :patient_specific_required, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "patientSpecificRequired"

      field :quantity_constraint, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogQuantityConstraint }, optional: false, nullable: true, api_name: "quantityConstraint"

      field :prescription_requirements, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPrescriptionRequirements }, optional: false, nullable: false, api_name: "prescriptionRequirements"

      field :pricing, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalogPricing }, optional: false, nullable: true

      field :restricted_states, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "restrictedStates"

      field :route, -> { String }, optional: false, nullable: false

      field :shipping_options, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseCatalogShippingOptionsItem] }, optional: false, nullable: false, api_name: "shippingOptions"

      field :strength, -> { String }, optional: false, nullable: true

      field :unit, -> { String }, optional: false, nullable: true
    end
  end
end
