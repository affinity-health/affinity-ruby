# frozen_string_literal: true

module Affinity
  class Client
    # @param api_key [String]
    # @param base_url [String, nil]
    # @param max_retries [Integer]
    #
    # @return [void]
    def initialize(api_key:, base_url: nil, max_retries: 0, affinity_version: "2026-09-28", timeout: 60.0)
      @raw_client = Affinity::Internal::Http::RawClient.new(
        base_url: base_url || Affinity::Environment::PRODUCTION,
        headers: {
          "X-Fern-Language" => "Ruby",
          "x-affinity-api-key" => api_key.to_s,
          "Affinity-Version" => affinity_version
        },
        max_retries: max_retries,
        timeout: timeout
      )
    end

    # @return [Affinity::Locations::Client]
    def locations
      @locations ||= Affinity::Locations::Client.new(client: @raw_client)
    end

    # @return [Affinity::APIKeys::Client]
    def api_keys
      @api_keys ||= Affinity::APIKeys::Client.new(client: @raw_client)
    end

    # @return [Affinity::Account::Client]
    def account
      @account ||= Affinity::Account::Client.new(client: @raw_client)
    end

    # @return [Affinity::Pharmacies::Client]
    def pharmacies
      @pharmacies ||= Affinity::Pharmacies::Client.new(client: @raw_client)
    end

    # @return [Affinity::Orders::Client]
    def orders
      @orders ||= Affinity::Orders::Client.new(client: @raw_client)
    end

    # @return [Affinity::Team::Client]
    def team
      @team ||= Affinity::Team::Client.new(client: @raw_client)
    end

    # @return [Affinity::Practices::Client]
    def practices
      @practices ||= Affinity::Practices::Client.new(client: @raw_client)
    end

    # @return [Affinity::Patients::Client]
    def patients
      @patients ||= Affinity::Patients::Client.new(client: @raw_client)
    end

    # @return [Affinity::Catalog::Client]
    def catalog
      @catalog ||= Affinity::Catalog::Client.new(client: @raw_client)
    end

    # @return [Affinity::Webhooks::Client]
    def webhooks
      @webhooks ||= Affinity::Webhooks::Client.new(client: @raw_client)
    end
  end
end
