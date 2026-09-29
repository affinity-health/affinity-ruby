# frozen_string_literal: true

module Affinity
  module Types
    class PreviewOrderResponseOrderInputPatientProgramsItem < Internal::Types::Model
      field :ended_at, -> { String }, optional: false, nullable: true, api_name: "endedAt"

      field :name, -> { String }, optional: false, nullable: false

      field :started_at, -> { String }, optional: false, nullable: false, api_name: "startedAt"

      field :status, -> { Affinity::Types::PreviewOrderResponseOrderInputPatientProgramsItemStatus }, optional: false, nullable: false
    end
  end
end
