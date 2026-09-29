# frozen_string_literal: true

module Affinity
  module Orders
    module Types
      class UpdateOrderPrescriptionRequestPrescriptionStructuredSig < Internal::Types::Model
        field :dose, -> { String }, optional: false, nullable: false

        field :dose_unit, -> { String }, optional: false, nullable: false, api_name: "doseUnit"

        field :duration, -> { String }, optional: true, nullable: false

        field :frequency, -> { String }, optional: false, nullable: false

        field :indication, -> { String }, optional: true, nullable: false

        field :max_daily_use, -> { String }, optional: true, nullable: false, api_name: "maxDailyUse"

        field :prn, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :route, -> { String }, optional: false, nullable: false

        field :titration_schedule, -> { String }, optional: true, nullable: false, api_name: "titrationSchedule"
      end
    end
  end
end
