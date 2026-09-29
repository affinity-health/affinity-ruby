# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPrescriptionsItemClinicalObservationsItem < Internal::Types::Model
      field :display, -> { String }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::PreviewOrderResponseOrderInputPrescriptionsItemClinicalObservationsItemValue }, optional: false, nullable: false
    end
  end
end
