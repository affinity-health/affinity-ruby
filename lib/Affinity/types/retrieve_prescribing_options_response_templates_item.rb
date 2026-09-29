# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseTemplatesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :initial, -> { Affinity::Types::RetrievePrescribingOptionsResponseTemplatesItemInitial }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false

      field :preview, -> { String }, optional: false, nullable: false

      field :revision, -> { String }, optional: false, nullable: false
    end
  end
end
