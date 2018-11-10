FactoryBot.define do
  factory :calculation do
    first_value  { Faker::Number.number(2) }
    second_value { Faker::Number.number(2) }
  end

  trait :sum do
    operation { :op_sum }
  end

  trait :difference do
    operation { :op_difference }
  end

  trait :multiplication do
    operation { :op_multiplication }
  end

  trait :division do
    operation { :op_division }
  end
end
