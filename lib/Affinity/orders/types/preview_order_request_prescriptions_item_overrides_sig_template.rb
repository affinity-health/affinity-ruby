# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriptionsItemOverridesSigTemplate < Internal::Types::Model
        field :template_id, -> { String }, optional: false, nullable: false, api_name: "templateId"

        field :template_revision, -> { String }, optional: false, nullable: false, api_name: "templateRevision"

        field :values, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false
      end
    end
  end
end
