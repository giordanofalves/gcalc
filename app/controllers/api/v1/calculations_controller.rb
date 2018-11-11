module Api
  module V1
    class CalculationsController < ApplicationController
      before_action :set_operation, only: :create

      def create
        @calculation = Calculation.find_or_create_by(calculation_params)
        @calculation.increment!(:count)

        if @calculation.valid?
          render 'calculations/show.json'
        else
          render json: { errors: @calculation.errors }, status: :unprocessable_entity
        end
      end

      private

      def set_operation
        params['calculation'].merge!(
          operation: Calculation.operations[params[:commit]]
        )
      rescue StandardError
        render json: { errors: 'Error, invalid data provided.' }, status: :unprocessable_entity
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
