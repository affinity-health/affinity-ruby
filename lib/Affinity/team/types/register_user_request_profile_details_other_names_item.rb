# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class RegisterUserRequestProfileDetailsOtherNamesItem < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :credentials, -> { String }, optional: false, nullable: false

        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
