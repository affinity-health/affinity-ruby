# frozen_string_literal: true

module Affinity
  module Catalog
    class Client
      # @param client [Affinity::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Affinity::Items::Client]
      def items
        @items ||= Affinity::Catalog::Items::Client.new(client: @client)
      end

      # @return [Affinity::ShippingOptions::Client]
      def shipping_options
        @shipping_options ||= Affinity::Catalog::ShippingOptions::Client.new(client: @client)
      end

      # @return [Affinity::PrescribingOptions::Client]
      def prescribing_options
        @prescribing_options ||= Affinity::Catalog::PrescribingOptions::Client.new(client: @client)
      end

      # @return [Affinity::SellingPrices::Client]
      def selling_prices
        @selling_prices ||= Affinity::Catalog::SellingPrices::Client.new(client: @client)
      end
    end
  end
end
