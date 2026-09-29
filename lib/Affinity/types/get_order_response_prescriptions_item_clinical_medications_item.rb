# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponsePrescriptionsItemClinicalMedicationsItem < Internal::Types::Model
      field :display, -> { String }, optional: false, nullable: false

      field :ndc, -> { String }, optional: true, nullable: false

      field :rx_norm_cui, -> { String }, optional: true, nullable: false, api_name: "rxNormCui"

      field :source, -> { String }, optional: true, nullable: false
    end
  end
end
