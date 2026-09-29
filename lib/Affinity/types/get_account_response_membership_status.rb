# frozen_string_literal: true

module Affinity
  module Types
    module GetAccountResponseMembershipStatus
      extend Affinity::Internal::Types::Enum

      ACTIVE = "active"
      DISABLED = "disabled"
      INVITED = "invited"
    end
  end
end
