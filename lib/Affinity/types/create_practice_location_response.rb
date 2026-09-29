# frozen_string_literal: true

module Affinity
  module Types
    class CreatePracticeLocationResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::CreatePracticeLocationResponseObject }, optional: false, nullable: false

      field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"

      field :name, -> { String }, optional: false, nullable: false

      field :timezone, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: false

      field :line1, -> { String }, optional: false, nullable: true

      field :line2, -> { String }, optional: false, nullable: true

      field :phone, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true, api_name: "postalCode"

      field :state, -> { String }, optional: false, nullable: true

      field :status, -> { Affinity::Types::CreatePracticeLocationResponseStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
