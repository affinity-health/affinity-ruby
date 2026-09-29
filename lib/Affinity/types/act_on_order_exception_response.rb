# frozen_string_literal: true

module Affinity
  module Types
    class ActOnOrderExceptionResponse < Internal::Types::Model
      field :action, -> { String }, optional: false, nullable: false

      field :exception_id, -> { String }, optional: false, nullable: false, api_name: "exceptionId"

      field :status, -> { Affinity::Types::ActOnOrderExceptionResponseStatus }, optional: false, nullable: false
    end
  end
end
