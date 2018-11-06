module Api
  module V1
    class CalculationsController < ApplicationController
      before_action :set_operation, only: :create

      def create
        @calculation = Calculation.find_or_create_by(calculation_params)
        @calculation.increment!(:count)
        render json: @calculation, status: :ok
      end

      private

      def set_operation
        params['calculation'].merge!(
          operation: Calculation.operations["op_#{params[:commit]}"]
        )
      end

      def calculation_params
        params.require(:calculation).permit(
          :first_value,
          :second_value,
          :operation
        )
      end
    end
  end
end
