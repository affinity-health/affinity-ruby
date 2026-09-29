# frozen_string_literal: true

module Affinity
  module Types
    class UpdatePracticeResponseContactsPrimary < Internal::Types::Model
      field :email, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :phone, -> { String }, optional: true, nullable: false
    end
  end
end
