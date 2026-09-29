# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePracticeResponseContacts < Internal::Types::Model
      field :compliance, -> { Affinity::Types::UpdatePracticeResponseContactsCompliance }, optional: false, nullable: true

      field :primary, -> { Affinity::Types::UpdatePracticeResponseContactsPrimary }, optional: false, nullable: true
    end
  end
end
