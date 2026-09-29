# frozen_string_literal: true

module Affinity
  module Types
    class GetAPIAccessResponse < Internal::Types::Model
      field :api_key, -> { Affinity::Types::GetAPIAccessResponseAPIKey }, optional: false, nullable: false, api_name: "apiKey"

      field :livemode, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :object, -> { Affinity::Types::GetAPIAccessResponseObject }, optional: false, nullable: false

      field :scopes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :service_account, -> { Affinity::Types::GetAPIAccessResponseServiceAccount }, optional: false, nullable: false, api_name: "serviceAccount"
    end
  end
end
