# frozen_string_literal: true

module Affinity
  module Types
    module GetAccountResponseMembershipRole
      extend Affinity::Internal::Types::Enum

      ADMINISTRATOR = "administrator"
      CLINICAL_REVIEWER = "clinical_reviewer"
      DEVELOPER = "developer"
      OPERATIONS = "operations"
      OWNER = "owner"
      VIEWER = "viewer"
      SERVICE_KEY = "service_key"
    end
  end
end
