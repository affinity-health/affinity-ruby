# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePatientResponseExternalIdentitiesItem < Internal::Types::Model
      field :source, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
