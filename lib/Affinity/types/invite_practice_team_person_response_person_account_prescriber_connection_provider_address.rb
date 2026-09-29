# frozen_string_literal: true

module Affinity
  module Types
    class InvitePracticeTeamPersonResponsePersonAccountPrescriberConnectionProviderAddress < Internal::Types::Model
      field :line1, -> { String }, optional: false, nullable: false

      field :line2, -> { String }, optional: true, nullable: false

      field :city, -> { String }, optional: false, nullable: false

      field :state, -> { String }, optional: false, nullable: false

      field :postal_code, -> { String }, optional: false, nullable: false, api_name: "postalCode"

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
