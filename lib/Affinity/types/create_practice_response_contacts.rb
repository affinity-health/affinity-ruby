# frozen_string_literal: true

module Affinity
  module Types
    class CreatePracticeResponseContacts < Internal::Types::Model
      field :compliance, -> { Affinity::Types::CreatePracticeResponseContactsCompliance }, optional: false, nullable: true

      field :primary, -> { Affinity::Types::CreatePracticeResponseContactsPrimary }, optional: false, nullable: true
    end
  end
end
