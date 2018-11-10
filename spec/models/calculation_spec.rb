require 'rails_helper'

RSpec.describe Calculation, type: :model do
  describe "Should Respond" do
    it { should respond_to(:operation) }
    it { should respond_to(:first_value) }
    it { should respond_to(:second_value) }
    it { should respond_to(:result) }
    it { should respond_to(:count) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe "Enums" do
    it { should define_enum_for(:operation).with_values(op_sum: 0, op_difference: 1, op_multiplication: 2, op_division: 3) }
  end

  describe "#calculate" do
    let(:sum)            { build(:calculation, :sum) }
    let(:difference)     { build(:calculation, :difference) }
    let(:multiplication) { build(:calculation, :multiplication) }
    let(:division)       { build(:calculation, :division) }

    context 'sum of values' do
      it { expect(sum.calculate).to equal(sum.first_value + sum.second_value) }
    end

    context 'difference of values' do
      it { expect(difference.calculate).to equal(difference.first_value - difference.second_value) }
    end

    context 'multiplication of values' do
      it { expect(multiplication.calculate).to equal(multiplication.first_value * multiplication.second_value) }
    end

    context 'division of values' do
      it { expect(division.calculate).to equal(division.first_value / division.second_value) }
    end
  end
end
