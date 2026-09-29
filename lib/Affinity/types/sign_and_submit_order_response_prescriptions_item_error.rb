# frozen_string_literal: true

module Affinity
  module Types
    class SignAndSubmitOrderResponsePrescriptionsItemError < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :detail, -> { String }, optional: false, nullable: false

      field :status, -> { Affinity::Types::SignAndSubmitOrderResponsePrescriptionsItemErrorStatus }, optional: false, nullable: false
    end
  end
end
