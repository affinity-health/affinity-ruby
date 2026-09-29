# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeResponseContacts < Internal::Types::Model
      field :compliance, -> { Affinity::Types::GetPracticeResponseContactsCompliance }, optional: false, nullable: true

      field :primary, -> { Affinity::Types::GetPracticeResponseContactsPrimary }, optional: false, nullable: true
    end
  end
end
