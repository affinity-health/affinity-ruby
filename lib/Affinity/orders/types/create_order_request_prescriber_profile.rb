# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class CreateOrderRequestPrescriberProfile < Internal::Types::Model
        field :email, -> { String }, optional: true, nullable: false

        field :phone, -> { String }, optional: true, nullable: false
      end
    end
  end
end
