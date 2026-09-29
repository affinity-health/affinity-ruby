# frozen_string_literal: true

module Affinity
  module Types
    class CancelOrderResponseFulfillmentsItemCancellationsItem < Internal::Types::Model
      field :attempts, -> { Integer }, optional: false, nullable: false

      field :confirmed_at, -> { String }, optional: false, nullable: true, api_name: "confirmedAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :error_code, -> { String }, optional: false, nullable: true, api_name: "errorCode"

      field :error_message, -> { String }, optional: false, nullable: true, api_name: "errorMessage"

      field :id, -> { String }, optional: false, nullable: false

      field :provider_status, -> { String }, optional: false, nullable: true, api_name: "providerStatus"

      field :reason, -> { String }, optional: false, nullable: false

      field :requested_at, -> { String }, optional: false, nullable: false, api_name: "requestedAt"

      field :requested_by, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemCancellationsItemRequestedBy }, optional: false, nullable: false, api_name: "requestedBy"

      field :resolved_at, -> { String }, optional: false, nullable: true, api_name: "resolvedAt"

      field :sent_at, -> { String }, optional: false, nullable: true, api_name: "sentAt"

      field :source, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemCancellationsItemSource }, optional: false, nullable: false

      field :status, -> { Affinity::Types::CancelOrderResponseFulfillmentsItemCancellationsItemStatus }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
