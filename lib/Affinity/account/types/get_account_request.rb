# frozen_string_literal: true

module Affinity
  module Account
    module Types
      class GetAccountRequest < Internal::Types::Model
        field :org_id, -> { String }, optional: true, nullable: false, api_name: "orgId"
      end
    end
  end
end
