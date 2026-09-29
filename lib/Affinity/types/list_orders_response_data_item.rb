# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItem < Internal::Types::Model
      field :revision, -> { String }, optional: false, nullable: false

      field :otc_items, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemOtcItemsItem] }, optional: false, nullable: false, api_name: "otcItems"

      field :practice_medication_total_cents, -> { Integer }, optional: false, nullable: true, api_name: "practiceMedicationTotalCents"

      field :external_order_id, -> { String }, optional: false, nullable: true, api_name: "externalOrderId"

      field :metadata, -> { Affinity::Types::ListOrdersResponseDataItemMetadata }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :fulfillments, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemFulfillmentsItem] }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :lifecycle_events, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemLifecycleEventsItem] }, optional: false, nullable: false, api_name: "lifecycleEvents"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :object, -> { Affinity::Types::ListOrdersResponseDataItemObject }, optional: false, nullable: false

      field :patient_external_id, -> { String }, optional: false, nullable: true, api_name: "patientExternalId"

      field :patient_id, -> { String }, optional: false, nullable: false, api_name: "patientId"

      field :patient_name, -> { String }, optional: false, nullable: false, api_name: "patientName"

      field :patient_state, -> { String }, optional: false, nullable: false, api_name: "patientState"

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :prescriber_name, -> { String }, optional: false, nullable: true, api_name: "prescriberName"

      field :prescriber_npi, -> { String }, optional: false, nullable: true, api_name: "prescriberNpi"

      field :review, -> { Affinity::Types::ListOrdersResponseDataItemReview }, optional: false, nullable: true

      field :prescriptions, -> { Internal::Types::Array[Affinity::Types::ListOrdersResponseDataItemPrescriptionsItem] }, optional: false, nullable: false

      field :status, -> { Affinity::Types::ListOrdersResponseDataItemStatus }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
