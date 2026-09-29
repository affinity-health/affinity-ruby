# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponsePrescriptionsItemClinicalObservationsItem < Internal::Types::Model
      field :code, -> { String }, optional: true, nullable: false

      field :display, -> { String }, optional: false, nullable: false

      field :value, -> { Affinity::Types::CancelOrderResponsePrescriptionsItemClinicalObservationsItemValue }, optional: false, nullable: false

      field :unit, -> { String }, optional: false, nullable: false
    end
  end
end
