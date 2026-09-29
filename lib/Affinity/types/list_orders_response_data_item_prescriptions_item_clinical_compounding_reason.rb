# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemPrescriptionsItemClinicalCompoundingReason < Internal::Types::Model
      field :category, -> { String }, optional: true, nullable: false

      field :context, -> { String }, optional: false, nullable: false
    end
  end
end
