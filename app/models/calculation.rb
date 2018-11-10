class Calculation < ApplicationRecord
  # todo: add validation data here?
  enum operation: { op_sum: 0, op_difference: 1, op_multiplication: 2, op_division: 3 }

  before_save :calculate

  def calculate
    values = [first_value, second_value]
    self.result =
      case operation
      when 'op_sum'
        values.sum
      when 'op_difference'
        values.reduce(:-)
      when 'op_multiplication'
        values.reduce(:*)
      when 'op_division'
        values.reduce(:/)
      end
  end
end
