# frozen_string_literal: true

module Affinity
  module Team
    module Types
      class UpdatePracticeTeamPrescriberRequest < Internal::Types::Model
        field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

        field :prescriber_id, -> { String }, optional: false, nullable: false, api_name: "prescriberId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

        field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

        field :credentials, -> { String }, optional: true, nullable: false

        field :phone, -> { String }, optional: true, nullable: false

        field :address, -> { Affinity::Team::Types::UpdatePracticeTeamPrescriberRequestAddress }, optional: true, nullable: false

        field :practice_status, -> { Affinity::Team::Types::UpdatePracticeTeamPrescriberRequestPracticeStatus }, optional: true, nullable: false, api_name: "practiceStatus"
      end
    end
  end
end
