# frozen_string_literal: true

module Affinity
  module Types
    module CancelOrderResponseFulfillmentsItemShippingMethod
      extend Affinity::Internal::Types::Enum

      STANDARD = "standard"
      EXPEDITED = "expedited"
      OVERNIGHT = "overnight"
      PICKUP = "pickup"
      LOCAL_DELIVERY = "local_delivery"
    end
  end
end
