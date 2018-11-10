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

  describe "Validations" do
    it { should validate_presence_of(:operation) }
    it { should validate_presence_of(:first_value) }
    it { should validate_presence_of(:second_value) }
    it { should validate_numericality_of(:first_value) }
    it { should validate_numericality_of(:second_value) }
  end

  describe "Enums" do
    it { should define_enum_for(:operation).
          with_values(sum: 0, difference: 1, multiplication: 2, division: 3).
          with_suffix }
  end

  describe "#calculate" do
    let(:sum)            { build(:calculation, :sum) }
    let(:difference)     { build(:calculation, :difference) }
    let(:multiplication) { build(:calculation, :multiplication) }
    let(:division)       { build(:calculation, :division) }

    context 'sum of values' do
      it { expect(sum.calculate).to eq(sum.first_value + sum.second_value) }
    end

    context 'difference of values' do
      it { expect(difference.calculate).to eq(difference.first_value - difference.second_value) }
    end

    context 'multiplication of values' do
      it { expect(multiplication.calculate).to eq(multiplication.first_value * multiplication.second_value) }
    end

    context 'division of values' do
      it { expect(division.calculate).to eq(division.first_value.to_f / division.second_value.to_f) }
    end
  end

  describe "#operation_description" do
    let(:sum)            { build(:calculation, :sum) }
    let(:difference)     { build(:calculation, :difference) }
    let(:multiplication) { build(:calculation, :multiplication) }
    let(:division)       { build(:calculation, :division) }

    context 'sum of values' do
      it { expect(sum.operation_description).to eq("#{sum.first_value} + #{sum.second_value}") }
    end

    context 'difference of values' do
      it { expect(difference.operation_description).to eq("#{difference.first_value} - #{difference.second_value}") }
    end

    context 'multiplication of values' do
      it { expect(multiplication.operation_description).to eq("#{multiplication.first_value} * #{multiplication.second_value}") }
    end

    context 'division of values' do
      it { expect(division.operation_description).to eq("#{division.first_value} / #{division.second_value}") }
    end
  end
end
