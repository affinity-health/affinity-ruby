# frozen_string_literal: true

module Affinity
  module Types
    class GetAPIAccessResponseServiceAccount < Internal::Types::Model
      field :api_version, -> { Affinity::Types::GetAPIAccessResponseServiceAccountAPIVersion }, optional: false, nullable: false, api_name: "apiVersion"

      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::GetAPIAccessResponseServiceAccountObject }, optional: false, nullable: false

      field :subject_id, -> { String }, optional: false, nullable: false, api_name: "subjectId"

      field :subject_type, -> { String }, optional: false, nullable: false, api_name: "subjectType"
    end
  end
end
