# frozen_string_literal: true

module Affinity
  module Types
    module GetPatientAllergiesResponseAllergiesItemVerificationStatus
      extend Affinity::Internal::Types::Enum

      UNCONFIRMED = "unconfirmed"
      PRESUMED = "presumed"
      CONFIRMED = "confirmed"
    end
  end
end
