# frozen_string_literal: true

module Affinity
  module Types
    module ListOrdersResponseDataItemFulfillmentsItemShippingMethod
      extend Affinity::Internal::Types::Enum

      STANDARD = "standard"
      EXPEDITED = "expedited"
      OVERNIGHT = "overnight"
      PICKUP = "pickup"
      LOCAL_DELIVERY = "local_delivery"
    end
  end
end
