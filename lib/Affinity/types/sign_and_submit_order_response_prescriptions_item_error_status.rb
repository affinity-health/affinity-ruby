# frozen_string_literal: true

module Affinity
  module Types
    class SignAndSubmitOrderResponsePrescriptionsItemErrorStatus < Internal::Types::Model
      extend Affinity::Internal::Types::Union

      member -> { Integer }

      member -> { Affinity::Types::SignAndSubmitOrderResponsePrescriptionsItemErrorStatusOne }
    end
  end
end
