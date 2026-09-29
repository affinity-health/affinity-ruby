# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemFulfillmentsItemCancellationsItemRequestedBy < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { String }, optional: false, nullable: false
    end
  end
end
