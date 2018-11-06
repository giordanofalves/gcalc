require 'rails_helper'

RSpec.describe Calculation, type: :model do
  describe "Should Respond" do
    it { should respond_to(:operation) }
    it { should respond_to(:values) }
    it { should respond_to(:result) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe "Enums" do
    it { should define_enum_for(:operation).with_values(op_sum: 0, op_difference: 1, op_multiplication: 2, op_division: 3) }
  end
end
