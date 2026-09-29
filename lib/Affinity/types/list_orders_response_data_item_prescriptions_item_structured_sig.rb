# frozen_string_literal: true

module Affinity
  module Types
    class ListOrdersResponseDataItemPrescriptionsItemStructuredSig < Internal::Types::Model
      field :dose, -> { String }, optional: false, nullable: false

      field :dose_unit, -> { String }, optional: false, nullable: false, api_name: "doseUnit"

      field :frequency, -> { String }, optional: false, nullable: false

      field :route, -> { String }, optional: false, nullable: false

      field :prn, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :duration, -> { String }, optional: true, nullable: false

      field :indication, -> { String }, optional: true, nullable: false

      field :max_daily_use, -> { String }, optional: true, nullable: false, api_name: "maxDailyUse"

      field :titration_schedule, -> { String }, optional: true, nullable: false, api_name: "titrationSchedule"
    end
  end
end
