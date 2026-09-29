# frozen_string_literal: true

module Affinity
  module Types
    module SignAndSubmitOrderResponseStatus
      extend Affinity::Internal::Types::Enum

      SUBMITTED = "submitted"
      PARTIALLY_SUBMITTED = "partially_submitted"
      NOT_SUBMITTED = "not_submitted"
    end
  end
end
