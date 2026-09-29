# frozen_string_literal: true

module Affinity
  module Types
    class GetAPIAccessResponseAPIKey < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :key_prefix, -> { String }, optional: false, nullable: false, api_name: "keyPrefix"

      field :object, -> { Affinity::Types::GetAPIAccessResponseAPIKeyObject }, optional: false, nullable: false
    end
  end
end
