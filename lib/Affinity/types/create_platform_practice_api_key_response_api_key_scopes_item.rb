# frozen_string_literal: true

module Affinity
  module Types
    module CreatePlatformPracticeAPIKeyResponseAPIKeyScopesItem
      extend Affinity::Internal::Types::Enum

      CATALOG_READ = "catalog:read"
      SELLING_PRICES_READ = "selling_prices:read"
      SELLING_PRICES_WRITE = "selling_prices:write"
      CATALOG_PRICING_READ = "catalog_pricing:read"
      CATALOG_PRICING_WRITE = "catalog_pricing:write"
      FORMULATION_DEFAULTS_READ = "formulation_defaults:read"
      FORMULATION_DEFAULTS_WRITE = "formulation_defaults:write"
      PRACTICES_READ = "practices:read"
      PRACTICES_WRITE = "practices:write"
      SERVICE_KEYS_WRITE = "service_keys:write"
      LOCATIONS_READ = "locations:read"
      LOCATIONS_WRITE = "locations:write"
      ORDERS_READ = "orders:read"
      ORDERS_WRITE = "orders:write"
      ORDERS_SIGN = "orders:sign"
      PATIENTS_READ = "patients:read"
      PATIENTS_WRITE = "patients:write"
      TEAM_READ = "team:read"
      TEAM_WRITE = "team:write"
      HOSTED_SESSIONS_WRITE = "hosted_sessions:write"
      WEBHOOKS_READ = "webhooks:read"
      WEBHOOKS_WRITE = "webhooks:write"
    end
  end
end
