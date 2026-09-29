# frozen_string_literal: true

module Affinity
  module Practices
    module Types
      class CreatePracticeRequestAttestations < Internal::Types::Model
        field :authorized_practice_relationship, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "authorizedPracticeRelationship"

        field :authorized_phi_transfer, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "authorizedPhiTransfer"

        field :minimum_necessary_phi, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "minimumNecessaryPhi"

        field :provider_data_accuracy, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "providerDataAccuracy"
      end
    end
  end
end
