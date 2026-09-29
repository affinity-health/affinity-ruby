# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseFulfillmentsItemExceptionsItem < Internal::Types::Model
      field :actionable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :assigned_to, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemExceptionsItemAssignedTo }, optional: false, nullable: true, api_name: "assignedTo"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :due_at, -> { String }, optional: false, nullable: true, api_name: "dueAt"

      field :id, -> { String }, optional: false, nullable: false

      field :kind, -> { String }, optional: false, nullable: false

      field :resolution, -> { String }, optional: false, nullable: true

      field :resolved_at, -> { String }, optional: false, nullable: true, api_name: "resolvedAt"

      field :retryable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :severity, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemExceptionsItemSeverity }, optional: false, nullable: false

      field :status, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemExceptionsItemStatus }, optional: false, nullable: false

      field :summary, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
