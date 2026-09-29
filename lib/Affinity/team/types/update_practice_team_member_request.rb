# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class UpdatePracticeTeamMemberRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :member_id, -> { String }, optional: false, nullable: false, api_name: "memberId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :role, -> { Affinity::Team::Types::UpdatePracticeTeamMemberRequestRole }, optional: true, nullable: false

        field :roles, -> { Internal::Types::Array[Affinity::Team::Types::UpdatePracticeTeamMemberRequestRolesItem] }, optional: true, nullable: false

        field :status, -> { Affinity::Team::Types::UpdatePracticeTeamMemberRequestStatus }, optional: true, nullable: false

        field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "locationIds"
      end
    end
  end
end
