# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPrescriptionsItemClinicalDiagnosesItem < Internal::Types::Model
          field :code, -> { String }, optional: false, nullable: false

          field :display, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
