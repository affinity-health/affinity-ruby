# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestName < Internal::Types::Model
        field :first, -> { String }, optional: true, nullable: false

        field :last, -> { String }, optional: true, nullable: false

        field :middle, -> { String }, optional: true, nullable: false

        field :preferred, -> { String }, optional: true, nullable: false
      end
    end
  end
end
