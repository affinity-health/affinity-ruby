# frozen_string_literal: true

module Affinity
  module Types
    class GetPracticeTeamMemberResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: false, nullable: true, api_name: "externalId"

      field :name, -> { String }, optional: false, nullable: false

      field :email, -> { String }, optional: false, nullable: true

      field :location_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "locationIds"

      field :account, -> { Affinity::Types::GetPracticeTeamMemberResponseAccount }, optional: false, nullable: false

      field :next_actions, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "nextActions"
    end
  end
end
