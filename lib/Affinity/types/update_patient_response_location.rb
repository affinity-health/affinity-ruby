# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseLocation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :state, -> { String }, optional: false, nullable: true

      field :status, -> { Affinity::Types::UpdatePatientResponseLocationStatus }, optional: false, nullable: false
    end
  end
end
