# frozen_string_literal: true

module Affinity
  module Types
    class CreatePlatformPracticeAPIKeyResponseServiceAccount < Internal::Types::Model
      field :api_version, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseServiceAccountAPIVersion }, optional: false, nullable: false, api_name: "apiVersion"

      field :display_name, -> { String }, optional: false, nullable: false, api_name: "displayName"

      field :id, -> { String }, optional: false, nullable: false

      field :max_scopes, -> { Internal::Types::Array[Affinity::Types::CreatePlatformPracticeAPIKeyResponseServiceAccountMaxScopesItem] }, optional: false, nullable: false, api_name: "maxScopes"

      field :organization_id, -> { String }, optional: false, nullable: false, api_name: "organizationId"

      field :status, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseServiceAccountStatus }, optional: false, nullable: false

      field :subject_id, -> { String }, optional: false, nullable: false, api_name: "subjectId"

      field :subject_type, -> { Affinity::Types::CreatePlatformPracticeAPIKeyResponseServiceAccountSubjectType }, optional: false, nullable: false, api_name: "subjectType"
    end
  end
end
