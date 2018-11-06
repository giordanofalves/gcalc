class CalculationsController < ApplicationController
  def new
    @calculation = Calculation.new
  end
end
