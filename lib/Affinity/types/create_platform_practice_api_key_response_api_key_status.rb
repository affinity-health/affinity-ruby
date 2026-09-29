# frozen_string_literal: true

module Affinity
  module Types
    module CreatePlatformPracticeAPIKeyResponseAPIKeyStatus
      extend Affinity::Internal::Types::Enum

      ACTIVE = "active"
      EXPIRED = "expired"
      REVOKED = "revoked"
    end
  end
end
