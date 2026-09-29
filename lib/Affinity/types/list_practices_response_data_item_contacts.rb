# frozen_string_literal: true

module Affinity
  module Types
    class ListPracticesResponseDataItemContacts < Internal::Types::Model
      field :compliance, -> { Affinity::Types::ListPracticesResponseDataItemContactsCompliance }, optional: false, nullable: true

      field :primary, -> { Affinity::Types::ListPracticesResponseDataItemContactsPrimary }, optional: false, nullable: true
    end
  end
end
