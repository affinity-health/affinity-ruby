# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemFulfillmentsItemExceptionsItemAssignedTo < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
