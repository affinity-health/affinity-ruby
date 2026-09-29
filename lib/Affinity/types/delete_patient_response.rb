# frozen_string_literal: true

module Affinity
  module Types
    class DeletePatientResponse < Internal::Types::Model
      field :deleted, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::DeletePatientResponseObject }, optional: false, nullable: false
    end
  end
end
