# frozen_string_literal: true

module Affinity
  module Types
    class RegisterUserResponse < Internal::Types::Model
      field :object, -> { Affinity::Types::RegisterUserResponseObject }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :member_id, -> { String }, optional: false, nullable: false, api_name: "memberId"

      field :prescriber_id, -> { String }, optional: false, nullable: true, api_name: "prescriberId"

      field :external_id, -> { String }, optional: false, nullable: false, api_name: "externalId"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
