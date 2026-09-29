# frozen_string_literal: true

module Affinity
  module Types
    class RetrievePrescribingOptionsResponseInitial < Internal::Types::Model
      field :dose, -> { String }, optional: true, nullable: false

      field :dose_unit, -> { String }, optional: true, nullable: false, api_name: "doseUnit"

      field :duration, -> { String }, optional: true, nullable: false

      field :frequency, -> { String }, optional: true, nullable: false

      field :max_daily_use, -> { String }, optional: true, nullable: false, api_name: "maxDailyUse"

      field :prn, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :route, -> { String }, optional: true, nullable: false

      field :titration_schedule, -> { String }, optional: true, nullable: false, api_name: "titrationSchedule"
    end
  end
end
