# frozen_string_literal: true

module Affinity
  module Patients
    module Types
      class UpdatePatientRequestEncountersItem < Internal::Types::Model
        field :notes, -> { String }, optional: false, nullable: true

        field :occurred_at, -> { String }, optional: false, nullable: false, api_name: "occurredAt"

        field :provider_name, -> { String }, optional: false, nullable: true, api_name: "providerName"

        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
