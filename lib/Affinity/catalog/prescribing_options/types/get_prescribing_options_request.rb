# frozen_string_literal: true

module Affinity
  module Catalog
    module PrescribingOptions
      module Types
        class GetPrescribingOptionsRequest < Internal::Types::Model
          field :catalog_item_id, -> { String }, optional: false, nullable: false, api_name: "catalogItemId"

          field :practice_id, -> { String }, optional: false, nullable: false, api_name: "practiceId"
        end
      end
    end
  end
end
