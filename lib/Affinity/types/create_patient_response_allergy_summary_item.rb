# frozen_string_literal: true

module Affinity
  module Types
    class CreatePatientResponseAllergySummaryItem < Internal::Types::Model
      field :reaction, -> { String }, optional: false, nullable: true

      field :substance, -> { String }, optional: false, nullable: false
    end
  end
end
