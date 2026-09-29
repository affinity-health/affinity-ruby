# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseClinicalRequirementsItem < Internal::Types::Model
      field :field, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :type, -> { Affinity::Types::PreviewOrderResponseClinicalRequirementsItemType }, optional: false, nullable: false

      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :status, -> { Affinity::Types::PreviewOrderResponseClinicalRequirementsItemStatus }, optional: false, nullable: false
    end
  end
end
