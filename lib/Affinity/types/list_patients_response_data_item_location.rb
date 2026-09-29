# frozen_string_literal: true

module Affinity
  module Types
    class ListPatientsResponseDataItemLocation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :state, -> { String }, optional: false, nullable: true

      field :status, -> { Affinity::Types::ListPatientsResponseDataItemLocationStatus }, optional: false, nullable: false
    end
  end
end
