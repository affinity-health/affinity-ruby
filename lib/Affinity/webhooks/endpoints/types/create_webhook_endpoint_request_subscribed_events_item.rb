# frozen_string_literal: true

module Affinity
  module Webhooks
    module Endpoints
      module Types
        module CreateWebhookEndpointRequestSubscribedEventsItem
          extend Affinity::Internal::Types::Enum

          WEBHOOK_ENDPOINT_TEST = "webhook_endpoint.test"
          CANCELLATION_REQUESTED = "cancellation.requested"
          CANCELLATION_SENT = "cancellation.sent"
          CANCELLATION_CONFIRMED = "cancellation.confirmed"
          CANCELLATION_REJECTED = "cancellation.rejected"
          CANCELLATION_FAILED = "cancellation.failed"
          CANCELLATION_TOO_LATE = "cancellation.too_late"
          ORDER_CREATED = "order.created"
          ORDER_UPDATED = "order.updated"
          ORDER_REVIEW_REQUESTED = "order.review_requested"
          ORDER_CHANGES_REQUESTED = "order.changes_requested"
          ORDER_SIGNED = "order.signed"
          ORDER_REJECTED = "order.rejected"
          ORDER_SUBMITTED = "order.submitted"
          ORDER_ACCEPTED = "order.accepted"
          ORDER_PROCESSING = "order.processing"
          ORDER_SHIPPED = "order.shipped"
          ORDER_DELIVERED = "order.delivered"
          ORDER_BLOCKED = "order.blocked"
          ORDER_CANCELLED = "order.cancelled"
        end
      end
    end
  end
end
