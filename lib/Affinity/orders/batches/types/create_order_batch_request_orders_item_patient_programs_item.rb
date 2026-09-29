# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemPatientProgramsItem < Internal::Types::Model
          field :ended_at, -> { String }, optional: false, nullable: true, api_name: "endedAt"

          field :name, -> { String }, optional: false, nullable: false

          field :started_at, -> { String }, optional: false, nullable: false, api_name: "startedAt"

          field :status, -> { Affinity::Orders::Batches::Types::CreateOrderBatchRequestOrdersItemPatientProgramsItemStatus }, optional: false, nullable: false
        end
      end
    end
  end
end
