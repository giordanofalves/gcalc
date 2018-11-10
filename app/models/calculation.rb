class Calculation < ApplicationRecord
  validates :operation, :first_value, :second_value, presence: true
  validates :first_value, :second_value, numericality: { greater_than_or_equal_to: 0,
                                                         less_than_or_equal_to: 100,
                                                         only_integer: true }

  enum operation: { sum: 0, difference: 1, multiplication: 2, division: 3 }, _suffix: true

  before_save :calculate

  def calculate
    values = [first_value, second_value]
    self.result =
      case operation
      when 'sum'
        values.sum
      when 'difference'
        values.reduce(:-)
      when 'multiplication'
        values.reduce(:*)
      when 'division'
        values.map(&:to_f).reduce(:/)
      end
  end

  def operation_description
    case operation
      when 'sum'
        "#{first_value} + #{second_value}"
      when 'difference'
        "#{first_value} - #{second_value}"
      when 'multiplication'
        "#{first_value} * #{second_value}"
      when 'division'
        "#{first_value} / #{second_value}"
      end
  end
end
