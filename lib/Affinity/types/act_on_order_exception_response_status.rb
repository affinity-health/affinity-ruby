# frozen_string_literal: true

module Affinity
  module Types
    module ActOnOrderExceptionResponseStatus
      extend Affinity::Internal::Types::Enum

      OPEN = "open"
      ACKNOWLEDGED = "acknowledged"
      RESOLVED = "resolved"
    end
  end
end
