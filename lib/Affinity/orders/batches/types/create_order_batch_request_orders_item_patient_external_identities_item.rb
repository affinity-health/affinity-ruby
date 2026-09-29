# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPatientExternalIdentitiesItem < Internal::Types::Model
          field :source, -> { String }, optional: false, nullable: false

          field :value, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
