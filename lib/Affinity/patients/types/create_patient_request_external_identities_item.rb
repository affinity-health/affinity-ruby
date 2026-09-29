# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class CreatePatientRequestExternalIdentitiesItem < Internal::Types::Model
        field :source, -> { String }, optional: false, nullable: false

        field :value, -> { String }, optional: false, nullable: false
      end
    end
  end
end
