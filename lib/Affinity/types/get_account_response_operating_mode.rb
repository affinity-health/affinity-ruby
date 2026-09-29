# frozen_string_literal: true

module Affinity
  module Types
    module GetAccountResponseOperatingMode
      extend Affinity::Internal::Types::Enum

      PRODUCTION = "production"
      PRODUCTION_PENDING = "production_pending"
      SANDBOX = "sandbox"
      SUSPENDED = "suspended"
    end
  end
end
