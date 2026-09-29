# frozen_string_literal: true

module Affinity
  module Webhooks
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Affinity::Endpoints::Client]
      def endpoints
        @endpoints ||= Affinity::Webhooks::Endpoints::Client.new(client: @client)
      end

      # @return [Affinity::Events::Client]
      def events
        @events ||= Affinity::Webhooks::Events::Client.new(client: @client)
      end

      # @return [Affinity::Grants::Client]
      def grants
        @grants ||= Affinity::Webhooks::Grants::Client.new(client: @client)
      end
    end
  end
end
