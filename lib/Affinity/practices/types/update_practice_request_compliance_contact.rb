# frozen_string_literal: true

module Affinity
  module Practices
    module Types
      class UpdatePracticeRequestComplianceContact < Internal::Types::Model
        field :email, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: true, nullable: false
      end
    end
  end
end
