# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      module ActOnOrderExceptionRequestAction
        extend Affinity::Internal::Types::Enum

        ACKNOWLEDGE = "acknowledge"
        ASSIGN_TO_ME = "assign_to_me"
        CONTACT_PHARMACY = "contact_pharmacy"
        RECORD_OUTCOME = "record_outcome"
        RESOLVE = "resolve"
        RETRY = "retry"
      end
    end
  end
end
