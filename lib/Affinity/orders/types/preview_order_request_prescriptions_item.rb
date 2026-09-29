# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriptionsItem < Internal::Types::Model
        field :medication_id, -> { String }, optional: false, nullable: false, api_name: "medicationId"

        field :external_prescription_id, -> { String }, optional: true, nullable: false, api_name: "externalPrescriptionId"

        field :preset, -> { String }, optional: true, nullable: false

        field :expected_revision, -> { String }, optional: true, nullable: false, api_name: "expectedRevision"

        field :overrides, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItemOverrides }, optional: true, nullable: false
      end
    end
  end
end
