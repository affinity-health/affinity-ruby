# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatientName < Internal::Types::Model
      field :first, -> { String }, optional: false, nullable: false

      field :last, -> { String }, optional: false, nullable: false

      field :middle, -> { String }, optional: true, nullable: false

      field :preferred, -> { String }, optional: true, nullable: false
    end
  end
end
