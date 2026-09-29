# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponse < Internal::Types::Model
      field :clinical_requirements_satisfied, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "clinicalRequirementsSatisfied"

      field :clinical_issues, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseClinicalIssuesItem] }, optional: false, nullable: false, api_name: "clinicalIssues"

      field :clinical_requirements, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseClinicalRequirementsItem] }, optional: false, nullable: false, api_name: "clinicalRequirements"

      field :otc_items, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseOtcItemsItem] }, optional: false, nullable: false, api_name: "otcItems"

      field :shipping_groups, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseShippingGroupsItem] }, optional: false, nullable: false, api_name: "shippingGroups"

      field :totals, -> { Affinity::Types::PreviewOrderResponseTotals }, optional: false, nullable: false

      field :object, -> { Affinity::Types::PreviewOrderResponseObject }, optional: false, nullable: false

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :prescriptions, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponsePrescriptionsItem] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Affinity::Types::PreviewOrderResponseIssuesItem] }, optional: false, nullable: false

      field :status, -> { Affinity::Types::PreviewOrderResponseStatus }, optional: false, nullable: false

      field :order_input, -> { Affinity::Types::PreviewOrderResponseOrderInput }, optional: false, nullable: true, api_name: "orderInput"
    end
  end
end
