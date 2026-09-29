# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItemName < Internal::Types::Model
      field :first, -> { String }, optional: false, nullable: false

      field :last, -> { String }, optional: false, nullable: false

      field :middle, -> { String }, optional: false, nullable: true

      field :preferred, -> { String }, optional: false, nullable: true
    end
  end
end
