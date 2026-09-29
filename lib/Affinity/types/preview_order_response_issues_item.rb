# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseIssuesItem < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :path, -> { String }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
