# frozen_string_literal: true

module Affinity
  module Types
    class GetOrderResponseReview < Internal::Types::Model
      field :status, -> { Affinity::Types::GetOrderResponseReviewStatus }, optional: false, nullable: false

      field :reason, -> { String }, optional: false, nullable: true

      field :requested_at, -> { String }, optional: false, nullable: false, api_name: "requestedAt"

      field :completed_at, -> { String }, optional: false, nullable: true, api_name: "completedAt"

      field :canceled_at, -> { String }, optional: false, nullable: true, api_name: "canceledAt"

      field :resolved_at, -> { String }, optional: false, nullable: true, api_name: "resolvedAt"

      field :resolved_by, -> { Affinity::Types::GetOrderResponseReviewResolvedBy }, optional: false, nullable: true, api_name: "resolvedBy"

      field :provider_id, -> { String }, optional: false, nullable: true, api_name: "providerId"
    end
  end
end
