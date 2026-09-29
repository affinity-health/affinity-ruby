# frozen_string_literal: true

module Affinity
  module Types
    module GetAccountResponseAccountStatus
      extend Affinity::Internal::Types::Enum

      ACTIVE = "active"
      PENDING = "pending"
      SUSPENDED = "suspended"
    end
  end
end
