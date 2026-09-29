# frozen_string_literal: true

module Affinity
  module Types
    class CreatePracticeResponsePrescribersItem < Internal::Types::Model
      field :credentials, -> { String }, optional: true, nullable: false

      field :license_states, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "licenseStates"

      field :name, -> { String }, optional: false, nullable: false

      field :npi, -> { String }, optional: false, nullable: false
    end
  end
end
