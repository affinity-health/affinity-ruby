# frozen_string_literal: true

module Affinity
  module Orders
    module Batches
      module Types
        class CreateOrderBatchRequestOrdersItemMetadataValue < Internal::Types::Model
          extend Affinity::Internal::Types::Union

          member -> { String }

          member -> { Integer }

          member -> { Internal::Types::Boolean }
        end
      end
    end
  end
end
