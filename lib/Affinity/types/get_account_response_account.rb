# frozen_string_literal: true

module Affinity
  module Types
    class GetAccountResponseAccount < Internal::Types::Model
      field :allowed_return_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "allowedReturnUrls"

      field :display_name, -> { String }, optional: false, nullable: false, api_name: "displayName"

      field :id, -> { String }, optional: false, nullable: false

      field :object, -> { Affinity::Types::GetAccountResponseAccountObject }, optional: false, nullable: false

      field :slug, -> { String }, optional: false, nullable: false

      field :status, -> { Affinity::Types::GetAccountResponseAccountStatus }, optional: false, nullable: false

      field :support_email, -> { String }, optional: false, nullable: true, api_name: "supportEmail"

      field :website_url, -> { String }, optional: false, nullable: true, api_name: "websiteUrl"
    end
  end
end
