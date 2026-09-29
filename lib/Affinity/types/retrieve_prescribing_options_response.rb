# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponse < Internal::Types::Model
      field :compounding_reason, -> { Affinity::Types::RetrievePrescribingOptionsResponseCompoundingReason }, optional: false, nullable: false, api_name: "compoundingReason"

      field :compounding_reason_category_default, -> { Affinity::Types::RetrievePrescribingOptionsResponseCompoundingReasonCategoryDefault }, optional: false, nullable: true, api_name: "compoundingReasonCategoryDefault"

      field :compounding_reason_default, -> { String }, optional: false, nullable: true, api_name: "compoundingReasonDefault"

      field :default, -> { Affinity::Types::RetrievePrescribingOptionsResponseDefault }, optional: false, nullable: true

      field :formulation_default, -> { Affinity::Types::RetrievePrescribingOptionsResponseFormulationDefault }, optional: false, nullable: true, api_name: "formulationDefault"

      field :initial, -> { Affinity::Types::RetrievePrescribingOptionsResponseInitial }, optional: false, nullable: false

      field :medication, -> { Affinity::Types::RetrievePrescribingOptionsResponseMedication }, optional: false, nullable: false

      field :options, -> { Affinity::Types::RetrievePrescribingOptionsResponseOptions }, optional: false, nullable: false

      field :pharmacy_directions, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponsePharmacyDirectionsItem] }, optional: false, nullable: false, api_name: "pharmacyDirections"

      field :templates, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponseTemplatesItem] }, optional: false, nullable: false

      field :object, -> { Affinity::Types::RetrievePrescribingOptionsResponseObject }, optional: false, nullable: false

      field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :revision, -> { String }, optional: false, nullable: false

      field :catalog, -> { Affinity::Types::RetrievePrescribingOptionsResponseCatalog }, optional: false, nullable: false

      field :default_preset_id, -> { String }, optional: false, nullable: true, api_name: "defaultPresetId"

      field :presets, -> { Internal::Types::Array[Affinity::Types::RetrievePrescribingOptionsResponsePresetsItem] }, optional: false, nullable: false
    end
  end
end
