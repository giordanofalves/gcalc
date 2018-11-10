FactoryBot.define do
  factory :calculation do
    first_value  { Faker::Number.number(2) }
    second_value { Faker::Number.number(2) }
  end

  trait :sum do
    operation { :sum }
  end

  trait :difference do
    operation { :difference }
  end

  trait :multiplication do
    operation { :multiplication }
  end

  trait :division do
    operation { :division }
  end
end
