# frozen_string_literal: true

module Affinity
  module Types
    module ListShippingOptionsResponse
      # ListShippingOptionsResponse is an alias for Array

      # @option str [String]
      #
      # @return [untyped]
      def self.load(str)
        ::JSON.parse(str)
      end

      # @option value [untyped]
      #
      # @return [String]
      def self.dump(value)
        ::JSON.generate(value)
      end
    end
  end
end
