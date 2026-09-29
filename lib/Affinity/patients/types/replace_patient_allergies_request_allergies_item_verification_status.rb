# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      module ReplacePatientAllergiesRequestAllergiesItemVerificationStatus
        extend Affinity::Internal::Types::Enum

        UNCONFIRMED = "unconfirmed"
        PRESUMED = "presumed"
        CONFIRMED = "confirmed"
      end
    end
  end
end
