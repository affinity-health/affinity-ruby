# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class PreviewOrderRequestPrescriber < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :npi, -> { String }, optional: true, nullable: false

        field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"

        field :profile, -> { Affinity::Orders::Types::PreviewOrderRequestPrescriberProfile }, optional: true, nullable: false
      end
    end
  end
end
