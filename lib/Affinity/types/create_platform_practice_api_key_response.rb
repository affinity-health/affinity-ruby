# frozen_string_literal: true

module Affinity
  module Types
    class CreatePlatformPracticeAPIKeyResponse < Internal::Types::Model
      field :api_key, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseAPIKey }, optional: false, nullable: false, api_name: "apiKey"

      field :secret, -> { String }, optional: false, nullable: false

      field :service_account, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseServiceAccount }, optional: false, nullable: false, api_name: "serviceAccount"
    end
  end
end
