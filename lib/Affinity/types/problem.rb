# frozen_string_literal: true

module Affinity
  module Types
    class Problem < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :detail, -> { String }, optional: false, nullable: false

      field :instance, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :status, -> { Integer }, optional: false, nullable: false

      field :title, -> { String }, optional: false, nullable: false

      field :trace_id, -> { String }, optional: true, nullable: false, api_name: "traceId"

      field :type, -> { String }, optional: false, nullable: false
    end
  end
end
