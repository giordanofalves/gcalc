class Calculation < ApplicationRecord
  enum operation: { op_sum: 0, op_difference: 1, op_multiplication: 2, op_division: 3 }
end